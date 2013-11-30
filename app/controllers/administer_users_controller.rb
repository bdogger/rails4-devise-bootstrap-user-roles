class AdministerUsersController < ApplicationController
  require_role :admin
  before_action :set_user, only: [:show, :update]

  def index
    @users = User.all
  end

  def show
    @roles = Role.all.order('name')
  end

  def update
    @user.update(roles_update_params)
    if @user.save
      flash[:notice] = 'User saved'
      redirect_to administer_user_path(@user)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def roles_update_params
    params.require(:user).permit(:role_ids => [])
  end
end