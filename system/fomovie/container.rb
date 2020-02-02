# frozen_string_literal: true

require 'dry/web/container'
require 'dry/system/components'
require 'dry-monitor'
Dry::Monitor.load_extensions(:rack)

module Fomovie
  class Container < Dry::Web::Container
    configure do
      config.name = :fomovie
      config.listeners = true
      config.default_namespace = 'fomovie'
      config.auto_register = %w[lib/fomovie]
    end

    load_paths! 'lib'
  end
end
