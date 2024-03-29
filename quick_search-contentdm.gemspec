$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quick_search-contentdm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quick_search-contentdm"
  s.version     = QuickSearchContentdm::VERSION
  s.authors     = ["Chad Nelson"]
  s.email       = ["chad.nelson@temple.edu"]
  s.homepage    = "https://github.com/tulibraries/quick_search-contentdm"
  s.summary     = "Plugin for NCSU Quicksearch to search contentDM"
  s.description = "Plugin for NCSU Quicksearch to search contentDM"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.7.1"
  s.add_dependency "quick_search-core", '~> 0'

  s.add_development_dependency "sqlite3"
end
