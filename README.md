# Capistrano::service

Define custom service tasks in Capistrano 3.x.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-service'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-service

## Setup

Because this library creates tasks dynamically based on settings you define, setup is a little different than other Capistrano 3.x plugins. Before you require `capistrano/service` in your `Capfile`, you need to define the service you want to setup:

``` ruby
set :services, [:nginx, :unicorn]
require 'capistrano/service'
```

Once you've done this, you'll see that several tasks are defined for each service you added:

``` bash
$ cap -T
...
cap service:nginx:restart          # Restart service: nginx
cap service:nginx:start            # Start service: nginx
cap service:nginx:status           # Status for service: nginx
cap service:nginx:stop             # Stop service: nginx
cap service:nginx:reload           # Reload service: nginx
cap service:unicorn:restart        # Restart service: unicorn
cap service:unicorn:start          # Start service: unicorn
cap service:unicorn:status         # Status for service: unicorn
cap service:unicorn:stop           # Stop service: unicorn
cap service:unicorn:reload         # Reload service: unicorn
```

### Service Roles

By default, the service commands that you define will be executed on the `:all` role, however in some circumstances you may wish to only execute a service on specific roles.  You can do this by setting `{service_name}_role` before requiring `capistrano/service`.

``` ruby
set :services, [:nginx, :unicorn]
set :nginx_roles, :web
set :unicorn_roles, :app
require 'capistrano/service'
```

## Usage

Once you've set everything up, simply call your tasks directly (`cap service:nginx:restart`), or add them to the deploy flow:

``` ruby
namespace :deploy do
  after :publishing, 'service:nginx:restart', 'service:unicorn:restart'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
