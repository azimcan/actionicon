# frozen_string_literal: true

require_relative "lib/action_icon/version"

Gem::Specification.new do |spec|
  spec.name = "action_icon"
  spec.version = ActionIcon::VERSION
  spec.authors = ["Azim Can Kuruca"]
  spec.email = ["azimcankuruca@gmail.com"]

  spec.summary = "Add any icon library to a Rails app"
  spec.description = "Add any icon library to a Rails app, from Heroicons, to Lucide to Tabler (and others). Action Icon is library-agnostic, so you can add any library while using the same interface."
  spec.homepage = "https://github.com/azimcankuruca/action_icon"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/azimcankuruca/action_icon/"

  spec.files = Dir["{bin,app,config,db,lib,public}/**/*", "Rakefile", "README.md", "action_icon.gemspec", "Gemfile", "Gemfile.lock"]

  spec.required_ruby_version = ">= 3.1.0"
  spec.add_dependency "rails", "> 6.1"
  spec.add_runtime_dependency "nokogiri", "~> 1.16", ">= 1.16.4"
end
