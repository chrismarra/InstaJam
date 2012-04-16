# encoding: utf-8
require 'carrierwave/processing/mime_types'

class PhotoUploader < CarrierWave::Uploader::Base

  # Include MiniMagick and MimeTypes
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes
  
  process :set_content_type
  

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :resize_to_fit => [1000, 1000]
  
  #define the instajam routine
  def instajammer
    manipulate! do |img|
      jam = MiniMagick::Image.from_file(Rails.root + 'public/jamtexture.png')
      img = img.composite jam do |c|
        c.gravity "center"
      end
      img
    end
  end
      
  def optimize_image
    manipulate! do |img|
      img.format('JPEG')
      img = img.auto_orient
      img = img.quality 10
      img
    end
  end
  
  
  # Create the instajam'ed version
  version :instajam do
    process :instajammer
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #  "something.jpg" if original_filename
  #end

end
