class CategoriesController < ApplicationController
  before_action :login_required

  def index
    @categories = Category.all
    @username = session[:user]["name"]
  end 

  def show
    @category = Category.find(params[:id])
    @username = session[:user]["name"]
  end
 
  def new
    @category = Category.new
    @username = session[:user]["name"]
  end

  def create
    category_params = params.require(:category).permit(:name)
    @username = session[:user]["name"]
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path,notice:"カテゴリーを作成しました。"
    else
      render "new"
    end
  end


  def edit
    @category = Category.find(params[:id])
    @username = session[:user]["name"]
  end

  def update
    @username = session[:user]["name"]
    category_params = params.require(:category).permit(:name)
    @category = Category.find(params[:id])
    @category.assign_attributes(category_params)
    if @category.save
      redirect_to categories_path,notice:"カテゴリーを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @username = session[:user]["name"]
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice:"カテゴリーを削除しました。"
  end


end
