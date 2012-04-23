class Jam < ActiveRecord::Base
  attr_accessible :photo, :token
  mount_uploader :photo, PhotoUploader
  validates_presence_of :token
  validates_uniqueness_of :token
    
    before_validation(:on => :create) do
      self.token = rand(36**8).to_s(36) if self.new_record? and self.token.nil?
    end 
  
end
