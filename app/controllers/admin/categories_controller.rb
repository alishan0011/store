class Admin::CategoriesController < ApplicationController
  before_action :set_admin_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @admin_categories = Category.all
  end

  def show; end

  def new
    @admin_category = Category.new
  end

  def edit; end

  def create
    @admin_category = Category.new(admin_category_params)

    if @admin_category.save
      redirect_to admin_dashboard_path(anchor: "categories"), notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @admin_category.update(admin_category_params)
      redirect_to admin_dashboard_path(anchor: "categories"), notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin_category.destroy!
    redirect_to admin_categories_path, notice: "Category was successfully destroyed.", status: :see_other
  end

  private

  def set_admin_category
    @admin_category = Category.find(params[:id])
  end

  def admin_category_params
    params.require(:category).permit(:title, :session)
  end

  def require_admin
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
