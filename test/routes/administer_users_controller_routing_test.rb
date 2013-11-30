require 'test_helper'

class AdministerUsersControllerRoutingTest < ActionController::TestCase
  def setup
    @user = create(:user)
  end

  test 'should route to index' do
    assert_routing '/administer_users', {controller: 'administer_users', action: 'index'}
  end

  test 'should route to show' do
    assert_routing "administer_users/#{@user.id}", {controller: 'administer_users', action: 'show', id: "#{@user.id}"}
  end

  test 'should route to update' do
    assert_routing({method: 'put', path: "/administer_users/#{@user.id}"}, {controller: 'administer_users', action: 'update', id: "#{@user.id}"})
  end

end
