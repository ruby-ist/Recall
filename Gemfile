# frozen_string_literal: true

source "https://rubygems.org"

ruby '>=2.3'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-flash', :require=>'sinatra/flash'
gem 'dm-sqlite-adapter'
gem 'dm-core'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-validations'
gem 'sinatra-redirect-with-flash', :require=>'sinatra/redirect_with_flash'
gem 'data_mapper', :require=>false

group :production do
	gem 'puma'
end
