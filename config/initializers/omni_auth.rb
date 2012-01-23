NETFLIX_KEY = Secret['netflix_key'] # "67pv8b69p26huzyvsyaeff85"
NETFLIX_SECRET = Secret['netflix_secret'] # "sxX8y3GXKT"

FACEBOOK_KEY = Secret['facebook_key'] # "282532531807901"
FACEBOOK_SECRET = Secret['facebook_secret'] # "aa7a0f4e70099fb1577869a2b7772130"

if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
Rails.application.config.after_initialize.middleware.use OmniAuth::Builder do
  provider :netflix, NETFLIX_KEY, NETFLIX_SECRET
  provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET, :scope => "", :client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}
end

 Secret['netflix_key'] = "67pv8b69p26huzyvsyaeff85"
 Secret['netflix_secret'] = "sxX8y3GXKT"

 Secret['facebook_key'] = "282532531807901"
 Secret['facebook_secret'] = "aa7a0f4e70099fb1577869a2b7772130"