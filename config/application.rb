require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Chx
  class Application < Rails::Application
    config.autoload_paths << "#{config.root}/lib"

    config.generators do |g|
      g.assets = false
      g.helper = false
      g.view_specs = false
    end

    I18n.enforce_available_locales = false
  end
end
