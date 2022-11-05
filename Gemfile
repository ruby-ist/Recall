# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.7.4'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-flash', :require=>'sinatra/flash'
gem 'sqlite3', :group=> :development
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra-redirect-with-flash', :require=>'sinatra/redirect_with_flash'
gem 'rake'
gem 'puma', :group=> :production
gem 'activerecord-cockroachdb-adapter', :group=> :production
