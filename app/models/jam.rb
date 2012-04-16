class Jam < ActiveRecord::Base
  attr_accessible :photo
  mount_uploader :photo, PhotoUploader
end
