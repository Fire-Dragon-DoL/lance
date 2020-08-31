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

#### Syntax

```ruby
log = ::Lance::Log.build(STDOUT)

# Alternative 1
log.tags(:foo, :bar).info("message")
log.tags(:foo, :bar).info("message", foo: 123, bar: "ooo")
log.tags(:foo, :bar).info("message", anything_that_can_become_json)
log.tags(:foo, :bar).info(anything_that_can_become_json) do
  "dynamic parsed message"
end
log.tags(:foo, :bar).info(foo: 123, bar: "ooo") do
  "dynamic parsed message"
end
log.info("without tags")
log = log.tags(:foo, :bar)
log.tags(:baz).info("message") # 3 tags: :foo, :bar, :baz

# Alternative 2
# `tags` becomes a reserved word, essentially
log.info("message", tags: [:foo, :bar])
log.info("message", tags: [:foo, :bar], foo: 123, bar: "ooo")
# Can't use any object that can be converted to JSON and support tags
# As a solution, I use :data
log.info("message", data: anything_that_can_become_json, tags: [:foo, :bar])
log.info(data: anything_that_can_become_json, tags: [:foo, :bar]) do
  "dynamic parsed message"
end
log.info(foo: 123, bar: "ooo", tags: [:foo, :bar]) do
  "dynamic parsed message"
end
log.info("without tags")

# Alternative 3
# `tags` becomes a reserved word, essentially
log.info("message", tags(:foo, :bar))
log.info("message", tags(:foo, :bar), foo: 123, bar: "ooo")
# Can't use any object that can be converted to JSON and support tags
# As a solution, I use :data
log.info("message", tags(:foo, :bar), anything_that_can_become_json)
log.info(anything_that_can_become_json, tags(:foo, :bar)) do
  "dynamic parsed message"
end
log.info(foo: 123, bar: "ooo", tags(:foo, :bar)) do
  "dynamic parsed message"
end
log.info("without tags")
```

#### Output

Various type of outputs, configurable

```bash
# Verbose
[2020-01-01T15:15:00.000000Z] ::Foo::Bar#method {foo, bar} INFO: This is a message {"key": "value", "otherKey": 123}
# No class
[2020-01-01T15:15:00.000000Z] {foo, bar} INFO: This is a message {"key": "value", "otherKey": 123}
# No class, No tags
[2020-01-01T15:15:00.000000Z] INFO: This is a message {"key": "value", "otherKey": 123}
# Expanded Data
[2020-01-01T15:15:00.000000Z] INFO: This is a message
{
  "key": "value",
  "otherKey": 123
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lance.
