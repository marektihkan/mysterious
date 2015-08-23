## Installation

Install required gems by `bundle install`

Copy migrations configuration file `cp db/config.yml.sample db/config.yml`

Create database by hand or using migrations (it requires full privileges to create databases)

Run migrations `rake db:migrate DATABASE_ENV=development`

Copy application configuration file `cp config/environments/development.rb.sample config/environments/development.rb`

Run application `puma -p 3000`

## Usage

See `config/routes.rb` file to see all available API endpoints
