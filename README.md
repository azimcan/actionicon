# Action Icon

Add any icon library to a Rails app. Action Icon has first-party support for a [handful of libraries](#first-party-libraries). It is library agnostic so it can be used with any icon library using the same interface.

```erb
# Using the default icon library
<%= icon "check", class: "text-gray-500" %>

# Using any custom library
<%= icon "apple", library: "simple_icons", class: "text-black" %>
```

The icons are sourced directly from their respective GitHub repositories, ensuring Action Icon remain lightweight.


## Install

Add the gem
```bash
bundle add action_icon
```

Install, choosing one of the supported libraries
```bash
rails generate action_icon:install --libraries=LIBRARY_NAME
```

**Example**
```bash
rails generate action_icon:install --libraries=heroicons

# Or multiple at once
rails generate action_icon:install --libraries=heroicons lucide
```


## Usage

```ruby
# Uses the default library and variant defined in config/initializer/action_icon.rb
icon "check"

# Use another variant
icon "check", variant: "solid"

# Set library explicitly
icon "check", library: "heroicons"

# Add CSS
icon "check", class: "text-green-500"

# Add CSS with class_names
icon "check", class: ["size-4", "bg-red-500": !verified?, "bg-green-500": verified?]
# Article: https://railsdesigner.com/conditional-css-classes-in-rails/
# Documentation: https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html#method-i-token_list

# Add data attributes
icon "check", data: { controller: "swap" }

# Set the stroke-width
icon "check", stroke_width: 2
```


## First-party libraries

- [Boxicons](https://github.com/atisawd/boxicons) (1600+ icons)
- [Feather](https://github.com/feathericons/feather) (280+ icons)
- [Heroicons](https://github.com/tailwindlabs/heroicons) (300+ icons)
- [SidekickIcons](https://github.com/ndri/sidekickicons) (49 icons, complementing Heroicons)
- [Lucide](https://github.com/lucide-icons/lucide) (1500+ icons)
- [Phosphor](https://github.com/phosphor-icons/core) (9000+ icons)
- [Radix](https://github.com/radix-ui/icons/) (300+ icons)
- [Tabler](https://github.com/tabler/tabler-icons) (5700+ icons)


## Custom icon library

Need to use an icon from another library?

1. run `rails generate action_icon:initializer --custom=simple_icons`;
2. add the (SVG) icons to the created directory **app/assets/svg/icons/simple_icons**;

Every custom icon can now be used with the same interface as first-party icon libraries.
```ruby
icon "apple", library: "simple_icons", class: "text-black"
```


## Sync icons

To sync all libraries, run
```bash
rails generate action_icon:sync
```

To sync only a specific library, run
```bash
rails generate action_icon:sync --libraries=heroicons

# Or multiple at once:
rails generate action_icon:sync --libraries=heroicons lucide
```


## Contributing

This project uses [Standard](https://github.com/testdouble/standard) for formatting Ruby code. Please make sure to run `be standardrb` before submitting pull requests. Run tests via `rails test`.


## License

Action Icon is released under the [MIT License](https://opensource.org/licenses/MIT).
