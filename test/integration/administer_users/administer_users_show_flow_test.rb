require 'test_helper'

class AdministerUsersShowFlowTest < ActionDispatch::IntegrationTest
  def setup
    login
    @user = create(:user)
    @role_one = create(:role)
    @role_two = create(:role)
    @user.roles << @role_one
  end

  test 'should display the user and correct roles' do
    visit '/administer_users'
    within ("#user-row-#{@user.id}") do
      click_link 'View'
    end
    assert has_selector?("input[value='#{@role_one.id}'][type='checkbox'][checked='checked']")
    assert has_no_selector?("input[value='#{@role_two.id}'][type='checkbox'][checked='checked']")
  end
end