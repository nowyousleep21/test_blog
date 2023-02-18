require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TestBlog
  class Application < Rails::Application
    config.time_zone = 'Moscow'
    config.load_defaults 7.0
    config.i18n.default_locale = :ru
  end
end
