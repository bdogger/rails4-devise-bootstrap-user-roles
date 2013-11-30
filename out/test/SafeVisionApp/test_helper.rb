ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  include Warden::Test::Helpers
  Warden.test_mode!


  def setup
    Capybara.default_driver = :webkit
  end

  def login
    login_as(FactoryGirl.create(:user), scope: :user, run_callbacks: false)
  end
end

class ActionController::TestCase
  # Devise for testing logging in and active users
  include Devise::TestHelpers

  def login
    #@request.env['devise.mapping'] = Devise.mappings[:user]
    @my_user = create(:user)
    #@my_user.confirm!
    sign_in :user, @my_user
  end
end
