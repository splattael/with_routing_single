require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  gem "railties", "~> 4.2.7.1", require: %w[rails action_controller rails/test_help]
  # gem "railties", "~> 5.0.1", require: %w[rails action_controller rails/test_help]
end

ENV["RAILS_ENV"] = "test"

class WithRoutingApp < Rails::Application
  config.active_support.test_order = :random
  config.secret_key_base = "secret"
  config.eager_load = false

  routes.append do
    root to: "simple#index"
    get "simple" => "simple#index"
    get "with_defaults" => "with_defaults#index"
  end

  initialize!
end

class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
end

class SimpleController < ApplicationController
  def index
    render plain: root_path
  end
end

class WithDefaultsController < ApplicationController
  def index
    render plain: root_path
  end

  def default_url_options
    {defaults: true}
  end
end

class SimpleControllerTest < ActionController::TestCase
  test "works with predefined routes" do
    get :index
    assert_equal "/", response.body
  end

  test "works using `with_routing`" do
    with_routing do |set|
      set.draw do
        get "simple" => "simple#index"
      end

      get :index
      assert_equal "/", response.body
    end
  end
end

class WithDefaultsControllerTest < ActionController::TestCase
  test "works with predefined routes" do
    get :index
    assert_equal "/?defaults=true", response.body
  end

  test "works using `with_routing`" do
    with_routing do |set|
      set.draw do
        get "with_defaults" => "with_defaults#index"
      end

      # FAILS
      get :index
      assert_equal "/?defaults=true", response.body
    end
  end
end
