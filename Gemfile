source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache and Active Job
gem "solid_cache"
gem "solid_queue"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

gem "actioncable", group: :development
gem "action_policy"
gem "aws-sdk-s3", "~> 1.117"
gem "blurhash", "~> 0.1.7"
gem "bundler-audit", group: [:development, :test]
gem "capybara", "~> 3.38", group: [:test]
gem "closure_tree", "~> 7.4"
gem "deepl-rb", "~> 2.5.3"
gem "fastimage", "~> 2.2"
gem "i18n-tasks", "~> 1.0"
gem "image_processing", "~> 1.8"
gem "kaminari"
gem "listen", group: :development
gem "lookbook", "~> 2.1"
gem "mobility", "~> 1.2.9"
gem "postmark-rails"
gem "rails-healthcheck"
gem "rails-i18n", ">= 6.0.0"
gem "rspec-html-matchers", "~> 0.10.0", group: [:test]
gem "rspec_junit_formatter", "~> 0.6.0", group: [:test]
gem "rspec-rails", "~> 7.1", group: [:development, :test]
gem "rubocop-rspec", group: [:development, :test], require: false
gem "ruby_audit", group: [:development, :test]
gem "shrine", "~> 3.0"
gem "shrine-blurhash", "~> 0.2.0"
gem "simplecov", "~> 0.22.0", group: [:test]
gem "slim_lint", group: [:development, :test]
gem "sorcery", "~> 0.17"
gem "strip_attributes"
gem "trek", "~> 0.1.7", git: "https://git.etaminstud.io/etaminstudio/trek.git", branch: "172-ajouter-lookbook"
