source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
### gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

gem 'nestive', '~> 0.6'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'blacklight', '~> 6.3'
gem "blacklight_advanced_search"
gem 'mail_form'
gem 'simple_form'

gem "blacklight_range_limit", '~> 6.0'

gem 'bootbox-rails', '~>0.4'

gem 'config', '~> 1.3'

# gem 'osullivan', '~> XX'

gem 'turnout', '~> 2.4.0'

gem 'google-analytics-rails', '1.1.0'

gem 'rubyzip', '~> 1.2.1' # will load new rubyzip version

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'puma', '~> 3.5'

gem 'sitemap_generator', '~> 5.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'xray-rails'
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop', '~> 0.49.0', require: false
  gem 'rubocop-rspec', require: false
end

# eventually these should be just in development/testing
group :development, :test, :production do
  gem 'holder_rails'
  gem 'ffaker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'fakemail'
end

group :production do
  gem 'mysql2', '~> 0.4.4'
end

gem 'rsolr', '~> 1.0'
gem 'blacklight-marc', '~> 6.0'

gem 'devise', '~> 4.2.0'
gem 'devise-guests', '~> 0.3'

group :development, :test do
  gem 'solr_wrapper', '>= 0.15'
end

group :development, :test do
end
