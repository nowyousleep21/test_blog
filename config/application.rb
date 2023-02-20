require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TestBlog
  class Application < Rails::Application
    config.time_zone = 'Moscow'
    config.load_defaults 7.0
    config.i18n.default_locale = :ru
    if File.file?('/.dockerenv') == true
      config.web_console.whitelisted_ips = '192.168.0.0/16'
    end
  end
end
