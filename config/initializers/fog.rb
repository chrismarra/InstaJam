CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id     => ENV['S3INSTAKEY'],
    :aws_secret_access_key => ENV['S3INSTASECRET']
    
  }
  config.fog_directory  = 'instajam'                     # required
end
