
# Quick Search Contentdm Plugin
A plugin for [Quick Search](http://www.lib.ncsu.edu/reports/quicksearch) that allows you to search a ContentDM. The ContentDM instance's API must be publicly available.

# This project is not actively maintained. It might still work, it might not.

## Usage
Add the gem to your quick search application's `Gemfile` a then follow the instructions outlined in the Quick Search [Configuring Searchers](https://github.com/NCSU-Libraries/quick_search/blob/master/docs/configuration.md#configuring-searchers) docs.

### Configuration options
This plugin provides a few configuration points.

`api_url`: _Required_ Base URL to your contentDM backend server where your ContentDM Api is publicly available.

`records_url`: _Required_ Base URL to your public facing ContentDM site.

`custom_sort`: _Optional_ Field you want records sorted by. Defaults to 'relevance'

`collections`: _Optional_ A list of collectinos you would lke the search limited to. By default it searches all colelctions except unpublished colelctions.

_Example Config_
```yaml
defaults: &defaults
  api_url: "http://backend.contentdm.org"
  records_url: "http://frontend.contentdm.org"
  sort: title
  collections:
    - collection1
    - collection2
    - collections3

development:
  <<: *defaults

test:
  <<: *defaults

staging:
  <<: *defaults

production:
  <<: *defaults


```


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'quick_search-contentdm'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install quick_search-contentdm
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
