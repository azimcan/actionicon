require "test_helper"
require "generators/action_icon/sync_generator"

class SyncGeneratorTest < Rails::Generators::TestCase
  tests ActionIcon::SyncGenerator

  destination Rails.root.join("../../tmp/generators")

  setup :prepare_destination

  test "generator syncs icons" do
    # TODO: needs a bit of work; if you read this: please take a stab at it ❤️
    skip

    run_generator(%w[heroicons])

    assert_directory "app/assets/images/icons/heroicons"
  end
end
