require_relative "configuration/boxicons"
require_relative "configuration/feather"
require_relative "configuration/heroicons"
require_relative "configuration/sidekickicons"
require_relative "configuration/lucide"
require_relative "configuration/phosphor"
require_relative "configuration/radix"
require_relative "configuration/tabler"

module ActionIcon
  extend self

  def libraries
    {
      boxicons: ActionIcon::Configuration::Boxicons,
      feather: ActionIcon::Configuration::Feather,
      heroicons: ActionIcon::Configuration::Heroicons,
      sidekickicons: ActionIcon::Configuration::Sidekickicons,
      lucide: ActionIcon::Configuration::Lucide,
      phosphor: ActionIcon::Configuration::Phosphor,
      radix: ActionIcon::Configuration::Radix,
      tabler: ActionIcon::Configuration::Tabler
    }
  end
end
