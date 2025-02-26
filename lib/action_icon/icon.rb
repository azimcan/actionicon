require "action_icon/icon/file_path"
require "action_icon/icon/attributes"

class ActionIcon::Icon
  def initialize(name:, library:, arguments:, variant: nil)
    @name = name
    @library = library.to_s.inquiry
    @variant = (variant || set_variant).to_s
    @arguments = arguments
  end

  def svg
    raise ActionIcon::NotFound, error_message unless File.exist?(file_path)

    Nokogiri::HTML::DocumentFragment.parse(File.read(file_path))
      .at_css("svg")
      .tap { |svg| attach_attributes(to: svg) }
      .to_html
      .html_safe
  end

  private

  def set_variant
    ActionIcon.configuration.default_variant.presence ||
      ActionIcon.configuration.libraries.dig(@library.to_sym, :default_variant)
  end

  def error_message
    attributes = [
      @library,
      @variant,
      @name
    ].compact_blank

    "Icon not found: `#{attributes.join(" / ")}`"
  end

  def file_path = ActionIcon::Icon::FilePath.new(name: @name, library: @library, variant: @variant).call

  def attach_attributes(to:)
    ActionIcon::Icon::Attributes
      .new(default_attributes: default_attributes, arguments: @arguments)
      .attach(to: to)
  end

  def default_attributes
    {
      "stroke-width": default(:stroke_width),
      data: default(:data),
      class: default(:css)
    }
  end

  def default(key) = library_attributes.dig(:default, key)

  def library_attributes
    custom_library? ? custom_library : ActionIcon.configuration.libraries.dig(@library, @variant) || {}
  end

  def custom_library
    ActionIcon
      .configuration
      .libraries
      &.dig("custom")
      &.dig(@library.to_sym)&.with_defaults(
        {
          path: [ActionIcon.configuration.destination_path, @library].join("/")
        }
      ) || {}
  end

  def custom_library? = custom_library.present?
end
