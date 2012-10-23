CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
<<<<<<< HEAD
    :aws_access_key_id      => ENV['AMAZON_ACCESS_KEY'],       # required
    :aws_secret_access_key  => ENV['AMAZON_SECRET_KEY'],       # required
=======
    :aws_access_key_id      => '',       # required
    :aws_secret_access_key  => '',       # required
>>>>>>> 246623b... adding bronelius
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'vandy-hub'
 end