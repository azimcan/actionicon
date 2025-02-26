# frozen_string_literal: true

module ActionIcon
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    desc "Install Action Icon with the chosen libraries. This creates the configuration initializer and will sync the icons."

    class_option :libraries, type: :array, default: [], desc: "Choose libraries (#{ActionIcon.libraries.keys.join("/")})"
    class_option :destination, type: :string, default: ActionIcon.configuration.destination_path, desc: "Specify destination folder for icons"
    class_option :skip_sync, type: :boolean, default: false

    def initializer_generator
      generate("action_icon:initializer", *attributes)
    end

    def sync_generator
      return if options[:skip_sync] || options[:libraries].blank?

      generate("action_icon:sync", *attributes)
    end

    private

    def attributes = ["--libraries=#{options[:libraries].map(&:downcase).join(" ")}", "--destination=#{options[:destination]}"].join(" ")
  end
end
