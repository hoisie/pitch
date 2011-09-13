OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, 'consumer_key', 'consumer_secret', :scope => 'https://mail.google.com/' 
end
