class Admin::CategoriesController < ApplicationController
  before_action :set_admin_category, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @admin_categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    render partial: "admin/categories/show", locals: { category: @category }, formats: [:html], layout: false
  end

  def new
    @admin_category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
    render partial: "form", locals: { category: @category }, formats: [:html], layout: false
  end

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
    redirect_to admin_dashboard_path(anchor: "categories"), notice: "Category was successfully destroyed."
  end


  private

  def set_admin_category
    @admin_category = Category.find_by(id: params[:id])
      unless @admin_category
        redirect_to admin_categories_path, alert: "Category not found"
      end
  end


  def admin_category_params
    params.require(:category).permit(:title, :session)
  end

  def require_admin
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
