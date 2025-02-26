# frozen_string_literal: true

require "action_icon/helpers/icon_helper"

module ActionIcon
  class Railtie < Rails::Railtie
    initializer "action_icon.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include ActionIcon::Helpers::IconHelper
      end
    end

    initializer "action_icon.assets" do |app|
      gem_root = Pathname.new(Gem.loaded_specs["action_icon"].gem_dir)

      app.config.assets.paths << gem_root.join("app", "assets", "svg")
    end
  end
end
