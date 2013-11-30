require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @role = create(:role)
    @other_role = create(:role)
    @user = create(:user, roles: [@role])
  end

  test '#has_role should return true when user has role' do
    assert @user.has_role?(@role.name.to_sym)
  end

  test '#has_role should return false when user has role' do
    assert_not @user.has_role?(@other_role.name.to_sym)
  end

end
