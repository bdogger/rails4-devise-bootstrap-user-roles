require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'should route to home index' do
    assert_routing '/home/index', { controller: 'home', action: 'index' }
  end
end
