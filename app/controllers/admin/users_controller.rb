class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin

  def index
    @users = User.where(role: 'user')
  end

  def approve
    user = User.find(params[:id])
    user.update(approved: true)
    redirect_to admin_users_path, notice: 'User approved successfully.'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: 'User deleted successfully.'
  end

  def revoke
	  @user = User.find(params[:id])
	  if @user.update(approved: false)
	    redirect_to admin_users_path, notice: "User approval revoked."
	  else
	    redirect_to admin_users_path, alert: "Already revoked. Failed to revoke approval."
	  end
  end

  private

  def verify_admin
    unless current_user.role == 'admin'
      redirect_to root_path, alert: "Access denied."
    end
  end

end
