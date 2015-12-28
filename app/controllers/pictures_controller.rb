class PicturesController < ApplicationController
  include BossTokenAble::Controller
  include SetGallery
  include SetPicture

  respond_to :html, :json

  before_filter :enforce_read_only, only: [:create, :update]

  skip_boss_token :show, :temp_link

  def create
    upload_params.each do |image|
      @picture = gallery.pictures.build

      begin
        @picture.update_attributes!({ image: image })
      rescue ActiveRecord::RecordInvalid
        redirect_to gallery, flash: {error: "Unsupported file format: #{image.content_type}!"}
        return
      end
    end
    
    if session["#{gallery.slug}_action"] == 'timeline'
      redirect_to gallery_timeline_path(gallery)
    else
      redirect_to gallery
    end
  end

  def download
    send_data \
      File.read(picture.image.path),
      filename: picture.image.original_filename,
      disposition: 'attachment',
      type: picture.image.content_type
  end

  def show
    @picture = Picture.first_by_fingerprint!(show_params[:fingerprint])
  end

  def temp_link
    fp = TempLink
      .find_by_slug!(params[:slug])
      .picture
      .image_fingerprint

    @picture = Picture.first_by_fingerprint!(fp)

    render :show
  end

  def update
    picture.update_attributes!(update_params)
    respond_with picture
  end

  private
  
  def show_params
    params.permit(:fingerprint)
  end

  def update_params
    params.require(:picture).permit(:title, :tag_list)
  end

  def upload_params
    params.require(:picture).require(:image)
  end
end
