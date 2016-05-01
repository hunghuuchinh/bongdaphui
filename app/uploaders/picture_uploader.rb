# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
 process resize_to_fit: [800, 800]
   include CarrierWave::MiniMagick
  storage :file



   version :medium ,from_version: :large do
    process resize_to_fill: [400, 400]
  end

  version :small_thumb,from_version: :large do
    process resize_to_fill: [70, 60]
  end


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


    def extension_white_list
    %w(jpg jpeg gif png)
  end

end
