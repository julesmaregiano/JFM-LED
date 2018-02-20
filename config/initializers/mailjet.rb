Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_PUBLIC_KEY']
  config.secret_key = ENV['MAILJET_PRIVATE_KEY']
  config.default_from = 'mp@jfm-conseils.fr'
end
