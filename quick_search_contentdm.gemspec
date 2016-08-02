$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quick_search_contentdm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quick_search_contentdm"
  s.version     = QuickSearchContentdm::VERSION
  s.authors     = ["Chad Nelson"]
  s.email       = ["chad.nelson@temple.edu"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of QuickSearchContentdm."
  s.description = "TODO: Description of QuickSearchContentdm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "quick_search-core", '~> 0'

  s.add_development_dependency "sqlite3"
end
