source "https://rubygems.org"

ruby "2.2.1"

gem "airbrake"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem 'jquery-ui-rails'
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "rack-timeout", require: false
gem "rails", "4.2.1"
gem "recipient_interceptor"
gem "refills"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"
gem 'devise'
gem 'cancancan'
gem 'image_optim_bin'

# Paperclip

gem 'paperclip'
gem 'aws-sdk', '< 2.0'

# Activeadmin

gem 'activeadmin', github: 'activeadmin'

# Frontend

gem 'autoprefixer-rails'
gem 'slim-rails'
gem 'rails-assets-normalize-scss'
gem 'sass'

source 'https://rails-assets.org' do
  gem 'rails-assets-daviferreira--medium-editor'
  gem 'rails-assets-iacquire-medium-editor-insert-plugin'
  gem 'rails-assets-bigSlide'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "guard"
  gem "guard-livereload"
  gem 'rack-livereload'
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.1.0"
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
end
