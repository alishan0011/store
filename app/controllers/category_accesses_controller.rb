class CategoryAccessesController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_admin!

  def create
    @access = CategoryAccess.create(user_id: params[:user_id], category_id: params[:category_id])
    redirect_to admin_dashboard_path, notice: "Category assigned!"
  end

  private

  def ensure_admin!
    redirect_to root_path unless current_user.admin?
  end

end
