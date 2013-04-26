Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '197357143744736', 'a3d498e9ca6e84d0a336426c85f51f3b'
end