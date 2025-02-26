# frozen_string_literal: true

require_relative "../configuration"

module ActionIcon
  module Helpers
    module IconHelper
      def icon(name, library: ActionIcon.configuration.default_library, variant: nil, **arguments)
        ActionIcon::Icon.new(
          name: name,
          library: library,
          variant: variant,
          arguments: arguments
        ).svg
      end
    end
  end
end
