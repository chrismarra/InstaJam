class Jam < ActiveRecord::Base
  attr_accessible :photo
  mount_uploader :photo, PhotoUploader
  
  protected
    def before_validation_on_create
      self.token = rand(36**8).to_s(36) if self.new_record? and self.access_token.nil?
    end 
  
end
