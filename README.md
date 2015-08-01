# Rainforest Ruby Bindings



## Installation

You don't need this source code unless you want to modify the gem. If
you just want to use the Rainforest Ruby bindings, you should run:

```bash
gem install rainforest
```

If you want to build & install the gem from source:

```bash
gem build rainforest.gemspec
gem install rainforest-2.0.0.gem
```

## Documentation

Full documentation is available at [https://docs.rainfroestqa.com](https://docs.rainfroestqa.com).


## Requirements

* Ruby 1.8.7 or above. (Ruby 1.8.6 may work if you load
  ActiveSupport.) For Ruby versions before 1.9.2, you'll need to add this to your Gemfile:

```ruby
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.9.2')
  gem 'rest-client', '~> 1.6.8'
end
```

* rest-client, json


## Bundler

If you are installing via bundler, you should be sure to use the https
rubygems source in your Gemfile, as any gems fetched over http could potentially be compromised.

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'rainforest'
```

## Using the library

The following section covers some general info about this API library. If you are looking for documentation covering the entire API, check here: [https://docs.rainfroestqa.com](https://docs.rainfroestqa.com).

### Params and Headers

All API methods accept 2 optional arguments - the params and headers. For example, if you had `SomeResource` and wanted to call `#some_method(some_arg)`, all of the following would be valid:

```ruby
# With no custom params or headers
Rainforest::SomeResource.some_method(some_arg)

# With only custom params
Rainforest::SomeResource.some_method(some_arg, params)

# With only custom headers
Rainforest::SomeResource.some_method(some_arg, nil, headers)

# With both custom params and headers
Rainforest::SomeResource.some_method(some_arg, params, headers)
```

This is mostly useful when creating new resources, or when trying to use an API endpoint that supports pagination.


### Using Multiple API Keys

The API library was designed to support both developers who plan to only use one API key, as well as developers who may need to use multiple API keys in the same server.

By default most resource lookups use code like this:

```ruby
Rainforest.api_key = "your-api-key"
test = Rainforest::Test.retrieve(id)
```

but since the API key is set on the module, this could cause issues if you need to use multiple API keys. To get around this, simply use one of the API clients located in the `clients` folder. For example:

```ruby
client = Rainforest::DefaultClient.new("your-api-key")
test = client.tests.retreive(id)
```

The results from each will be the same, so if you prefer the client version you are welcome to use it even if you aren't using multiple API keys in production.


## Development

Test cases can be run with: `bundle exec rake test`

We welcome suggestions and feedback from our users :D
