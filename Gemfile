# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.7.4'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-flash', :require=>'sinatra/flash'
gem 'dm-sqlite-adapter', :group=> :development
gem 'dm-core'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-validations'
gem 'sinatra-redirect-with-flash', :require=>'sinatra/redirect_with_flash'

gem 'puma', :group=> :production
gem 'dm-mysql-adapter', :group=> :production
