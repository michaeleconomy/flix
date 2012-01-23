NETFLIX_KEY = Secret['netflix_key']
NETFLIX_SECRET = Secret['netflix_secret']

FACEBOOK_KEY = Secret['facebook_key']
FACEBOOK_SECRET = Secret['facebook_secret']

if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
Rails.application.config.after_initialize.middleware.use OmniAuth::Builder do
  provider :netflix, NETFLIX_KEY, NETFLIX_SECRET
  provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET, :scope => "", :client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}
end
