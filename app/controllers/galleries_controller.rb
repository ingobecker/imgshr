class GalleriesController < ApplicationController
  http_basic_authenticate_with \
    name: Settings.authentication.username,
    password: Settings.authentication.password,
    only: [:index, :destroy]

  respond_to :html, :json

  def create
    gallery = Gallery.create
    redirect_to gallery_path(gallery.slug)
  end

  def destroy
    gallery = Gallery.find_by_slug(params[:slug]) || not_found
    gallery.destroy!
    redirect_to galleries_path, flash: {info: 'Gallery deleted.'}
  end

  def index
    @galleries = Gallery.order('updated_at desc').all
  end

  def show
    @gallery = Gallery.find_by_slug(params[:slug]) || not_found

    @gallery.visits += 1
    @gallery.save!

    @last_picture = @gallery.pictures.order('created_at desc').limit(1).first
  end

  def update
    gallery = Gallery.find_by_slug(params[:slug]) || not_found
    gallery.update_attributes(gallery_params)
    respond_with gallery
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
