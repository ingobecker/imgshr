class OcrImageJob < ApplicationJob
  queue_as :default

  def perform(picture)
    picture.perform_ocr!
  end
end
