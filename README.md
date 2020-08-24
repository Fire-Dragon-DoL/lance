# Lance

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lance`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lance'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install lance
```

## Usage

### Draft

```ruby
class Log
  include ::Lance::Something
end

log = ::Lance::Log.build(STDOUT)
log.renderer = ::Lance::Renderer.build
log.filter = ::Lance::Filter.build

msg = log.build_message

msg.info("Foo", tags: [:some, :tags])

log.tags(:foo).info("message")
log.info(["message", field1: 123], tags: [:foo])
log.tags(:foo).info("message", foo: 123, bar: "ooo")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lance.
