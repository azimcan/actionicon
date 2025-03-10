require "test_helper"
require "action_icon/icon"

include IconHelper

class IconTest < ActiveSupport::TestCase
  test "it returns an icon SVG" do
    assert_match(/\A<svg[^>]*class="".*<\/svg>\z/m, icon("academic-cap"), "Expected SVG to start with <svg and contain 'class=\"\"'")
  end

  test "it should not include height" do
    refute_match(/height=/i, icon("academic-cap"), "SVG should not contain a 'height' attribute")
  end

  test "it returns a SVG with custom class" do
    assert_match(/class="size-4"/, icon("academic-cap", class: "size-4"), "SVG should contain 'class=\"size-4\"'")
  end

  test "it returns a SVG with custom data attributes" do
    assert_match(/data-controller="swap"/, icon("academic-cap", data: {controller: "swap"}), "SVG should contain 'data-attributes'")
  end

  test "it returns a SVG with custom strokeWidth" do
    assert_match(/stroke-width="3"/, icon("academic-cap", stroke_width: 3), "SVG should contain 'stroke-width=\"3\"'")
  end

  test "it parses class attributes" do
    assert_match(/class="present"/, icon("academic-cap", class: ["present": true, "not-present": false]), "SVG should contain 'class=\"present\"'")
  end

  test "setting variant, it returns a SVG" do
    assert_nothing_raised do
      icon("academic-cap", variant: "mini")
    end
  end

  test "setting variant as symbol, it returns a SVG" do
    assert_nothing_raised do
      icon("academic-cap", variant: :mini)
    end
  end

  test "default library (heroicons)" do
    assert_nothing_raised do
      icon("academic-cap")
    end
  end

  test "sidekickicons" do
    assert_nothing_raised do
      icon("arc-third", library: "sidekickicons")
    end
  end

  test "feather" do
    assert_nothing_raised do
      icon("activity", library: "feather")
    end
  end

  test "radix" do
    assert_nothing_raised do
      icon("accessibility", library: "radix")
    end
  end

  test "boxicons" do
    assert_nothing_raised do
      icon("abacus", library: "boxicons")
    end
  end

  test "lucide" do
    assert_nothing_raised do
      icon("graduation-cap", library: "lucide")
    end
  end

  test "phosphor" do
    assert_nothing_raised do
      icon("acorn", library: "phosphor")
    end

    assert_nothing_raised do
      icon("acorn", library: "phosphor", variant: :duotone)
    end
  end

  test "tabler" do
    assert_nothing_raised do
      icon("thumbs-up", library: "tabler")
    end
  end

  test "it raises ActionIcon::NotFound error" do
    assert_raises(ActionIcon::NotFound) do
      icon("non-existing-icon")
    end
  end
end
