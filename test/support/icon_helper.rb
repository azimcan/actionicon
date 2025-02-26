module IconHelper
  def icon(name, library: "heroicons", variant: nil, **arguments)
    ActionIcon::Icon.new(name: name, library:, variant:, arguments:).svg
  end
end
