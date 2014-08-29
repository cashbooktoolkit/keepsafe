
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bouncer, ENV['BOUNCER_KEY'], ENV['BOUNCER_SECRET'], ENV['BOUNCER_SITE_URL']
end

