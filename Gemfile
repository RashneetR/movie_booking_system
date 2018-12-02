source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'better_errors' # for formatting errors
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'bson_ext'
gem 'cancancan', '~> 1.15' # for permissions
gem 'carrierwave-mongoid' # for images
gem 'devise', '~> 4.2' # for authentication
gem 'file_validators', '~> 2.0', '>= 2.0.2'  #for validating image size
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jquery-turbolinks', '~> 2.1'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem 'momentjs-rails'
gem 'mongoid'
gem 'mongoid-grid_fs'
gem 'rails', '~> 5.2.1'
gem 'select2-rails', '~> 4.0', '>= 4.0.3'
gem 'whenever', '~> 0.9.4'
gem 'will_paginate', '~> 3.1'
gem 'will_paginate_mongoid', '~> 2.0', '>= 2.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
gem 'sidekiq', '~> 4.1', '>= 4.1.1'
# Use SCSS for stylesheets
gem 'redis', '~> 3.3', '>= 3.3.1'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'annotate'
  gem 'erb_lint', '~> 0.0.26' # for linting
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'rubocop', '~> 0.59.2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
