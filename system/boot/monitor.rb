# frozen_string_literal: true

Fomovie::Container.boot :monitor do
  init do
    require 'dry-monitor'
  end
end
