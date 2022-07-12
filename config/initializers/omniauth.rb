Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], {
    callback_path: 'http://localhost:3000/users/auth/facebook/callback'
  }
end
