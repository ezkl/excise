# Excise [![Build Status](https://secure.travis-ci.org/ezkl/excise.png)](http://travis-ci.org/ezkl/excise) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/ezkl/excise)
> This is a simple helper to extract values from a string based on a pattern.

A Ruby port of [laktek's](https://github.com/laktek/) [extract-values](https://github.com/laktek/extract-values).

## Installation

Add this line to your application's Gemfile:

    gem 'excise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install excise

## Usage

```ruby
require 'excise'

# Basic use
Excise('About {result_count} results ({load_time} seconds)',
       'About 49,000,000 results (0.15 seconds)')
#=> {:result_count=>"49,000,000", :load_time=>"0.15"}

# Memoize pattern for performance improvement
pattern = Excise.new('[{key}]')
pattern.parse '[value]' #=> {:key=>"value"}
pattern.parse '[other]' #=> {:key=>"other"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
