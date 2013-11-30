require 'test_helper'

class AdministerUsersShowTest < ActionDispatch::IntegrationTest
  def setup
    login
    @user = create(:user)
    @role = create(:role)
  end

  test 'should display the correct roles on update' do
    visit '/administer_users'
    within ("#user-row-#{@user.id}") do
      click_link 'View'
    end
    check(@role.name)
    click_button('Update')
    assert has_selector?("input[type='checkbox'][value='#{@role.id}'][checked='checked']")
    assert has_content?('User saved')
  end
end