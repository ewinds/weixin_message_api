source 'http://mirrors.tuna.tsinghua.edu.cn/rubygems'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem "le", "~> 2.1.7"
gem "thin", "~> 1.5.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "figaro"
gem "active_attr", "~> 0.8.2"

group :development, :test do
  gem 'rspec-rails'
  gem "factory_girl_rails"
  gem "better_errors", "~> 0.9.0"
end

group :test do
  gem "cucumber-rails", "~> 1.3.1", :require => false
  gem "capybara"
  gem "database_cleaner"
  gem "email_spec"
end
