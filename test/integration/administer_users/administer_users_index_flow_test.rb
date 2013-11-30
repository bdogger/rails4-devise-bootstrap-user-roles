require 'test_helper'

class AdministerUsersIndexFlowTest < ActionDispatch::IntegrationTest
  def setup
    login
    @employee = create(:user, roles: [Role.find_by(name: 'employee')])
    @customer = create(:user)
  end

  test 'should display list of users' do
    visit '/administer_users'
    assert has_content? @employee.email
    assert has_content? @customer.email
  end

end