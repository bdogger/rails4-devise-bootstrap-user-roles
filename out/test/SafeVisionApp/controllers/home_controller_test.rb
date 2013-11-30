require 'test_helper'

class HomeControllerTest < ActionController::TestCase
 test 'should get index' do
   login
   get :index
   assert_response :success
   assert_template :index
 end
end