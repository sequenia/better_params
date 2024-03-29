$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "better_params/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "better_params"
  spec.version     = BetterParams::VERSION
  spec.authors     = ["Bazov Peter"]
  spec.email       = ["petr@sequenia.com", "sb.truefalse@gmail.com"]
  spec.homepage    = "http://sequenia.com/"
  spec.summary     = "Better Params"
  spec.description = "Extension for default Rails params with useful features."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0", "< 8"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "sprockets-rails"
end
