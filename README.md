# Servicetrade

This gem will allow you to interact with the ServiceTrade API. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'servicetrade'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install servicetrade

## Usage
### Authentication
To start you must authenticate with the ServiceTrade API: 
```ruby
@authenticator = Servicetrade::Authenticator.new username, password
```
Once you have authenticated all API requests will require you to pass the authenticator as a parameter. For example to clock in you would write:
```ruby
CreateClockEvent.clock_in(job_id, @authenticator)
```
There are two ways to interact with the API with this gem, Resources and Actions.

### Actions
Actions include the above example, as well as clocking out, uploading attachments, and registering webhooks.
```ruby
CreateClockEvent.clock_out(job_id, @authenticator)
```

### Resources
Resources are typically REST structured data such as locations, users, jobs, etc. Resources are accesed with the following code:

```ruby
resource = Servicetrade::TagInterface.new
resource_interface = Servicetrade::ApiInterface.new(resource, @authenticator)
```

With the resource interface you can perform HTTP Verb requests:
```ruby
resource_interface.post({name: "MyTestTagNoEnt"})
resource_interface.post({name: "MyTestTagWithEnt", entityId: 1234567, entityType: 3}
resource.id = "1234567"
one_tag = @resource_interface.get
```
You can check which verbs are available by
```ruby
resource = Servicetrade::TagInterface.new
resource.allowed_verbs
-> ["GET", "POST", "PUT"]
```
You can also check the API documentation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/servicetrade.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
