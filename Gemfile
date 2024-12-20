source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.2.1.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 6.4', '>= 6.4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Logging
gem 'rollbar'
# search forms
gem 'ransack'
# pagination
gem 'will_paginate', '~> 3.3'
# Athentication
gem 'devise'
# Geocoding
gem 'geocoder'
# GraphQL
gem 'graphql'
# GraphQL cache
gem 'graphql-cache'
# redis
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
# sidekiq
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-unique-jobs'
gem 'sidekiq-limit_fetch'

# Rails admin
gem 'activeadmin'
# Image uploader
gem 'carrierwave'
# cloudinary image
gem 'cloudinary'

# Client library
gem "http"
# GQL UI
gem 'graphiql-rails'

# Jquery library
gem 'jquery-rails'
# Jquery UI
gem 'jquery-ui-rails'
# Bootstrap gem
gem 'bootstrap', '~> 5.1.3'
# Bootstrap Tooltips and popovers depend on tether for positioning
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Pagination styling
gem 'will_paginate-bootstrap-style'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'pry', '~> 0.14.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
