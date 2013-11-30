require 'test_helper'

class AdministerUsersControllerTest < ActionController::TestCase
  def setup
    login
    @role = create(:role)
    @user = create(:user)
  end

  test 'should return index on get to administer_users path' do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:users)
  end

  test 'should return show on get to administer_users path' do
    get :show, id: @user.id
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:roles)
  end

  test 'should return update on put to update' do
    put :update, id: @user.id, user: attributes_for(:user, role_ids: [@role.id])
    assert_response :redirect
    assert_not_nil assigns(:user)
  end

end