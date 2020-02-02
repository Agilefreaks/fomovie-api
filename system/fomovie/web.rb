# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'

module Fomovie
  class Web < Dry::Web::Roda::Application
    SAMPLE_VIDEO_URL = 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'

    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    use Rack::MethodOverride

    plugin :error_handler
    plugin :multi_route
    plugin :all_verbs
    plugin :json, classes: [Hash]
    plugin :json_parser, wrap: :unless_hash

    route do |r|
      # Enable this after writing your first web/routes/ file
      # r.multi_route

      r.root do
        {
          api: { version: 0.1 },
          _links: {
            play_movie: {
              href: "#{r.base_url}/play/sample",
              method: 'GET'
            }
          }
        }
      end

      r.get 'play', String do |_movie_id|
        { play: { url: SAMPLE_VIDEO_URL } }
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    load_routes!
  end
end
