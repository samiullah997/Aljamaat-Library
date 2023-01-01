class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index show create edit destroy]

  def index
    @categories = Category.all
  end

  def show;end

  def edit;end

  def new
    @category = Category.new
  end

  def update
    if @category.update(category_params)
      redirect_to user_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @category = Category.new(user_id: @user, **category_params)
    @category.user_id = current_user.id
    
    if @category.save
      redirect_to user_categories_path, notice: 'Category was successfully created.'
    else
      redirect_to user_categories_path, notice: 'Category was not created.'
    end
  end

  def destroy
    @category.destroy
    redirect_to user_categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
