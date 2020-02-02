# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'

module Fomovie
  class Web < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    use Rack::MethodOverride

    plugin :error_handler
    plugin :multi_route
    plugin :all_verbs

    route do |r|
      # Enable this after writing your first web/routes/ file
      # r.multi_route

      r.root do
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    # Request-specific options for dry-view context object
    def view_context_options
      {}
    end

    load_routes!
  end
end
