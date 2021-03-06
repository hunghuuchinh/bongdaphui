# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 700]

  storage :file

  version :medium do
    process resize_to_fill: [400, 400]
  end

  version :large do
    process resize_to_fill: [600, 600]
  end

  version :small_thumb, from_version: :medium do
    process resize_to_fill: [70, 60]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
