# Default protocol, host and canonical_url
# Can be removed or refactored when this is merged:
# https://github.com/rails/rails/issues/39566
Rails.application.routes.default_url_options[:protocol] = Rails.application.config.force_ssl ? "https" : "http"
Rails.application.routes.default_url_options[:host] = ENV.fetch("DEFAULT_HOSTNAME", "localhost:3000")
Rails.application.config.canonical_url = "#{Rails.application.routes.default_url_options[:protocol]}://#{Rails.application.routes.default_url_options[:host]}"
