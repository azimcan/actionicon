# frozen_string_literal: true

require "action_icon/sync/engine"

module ActionIcon
  class SyncGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    desc "Sync the chosen icon libraries from their respective git repos."

    class_option :libraries, type: :array, default: [], desc: "Choose libraries (#{ActionIcon.libraries.keys.join("/")})"

    def sync_icons
      raise "[Action Icon] Not a valid library" if libraries.empty?

      libraries.each { Sync::Engine.new(_1).sync }
    end

    private

    def libraries
      options[:libraries].map(&:downcase).presence || synced_libraries
    end

    def synced_libraries
      ActionIcon.libraries.keys.map(&:to_s).select do |library|
        Dir.exist?(File.join(ActionIcon.configuration.destination_path, library.to_s))
      end
    end
  end
end
