class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
 
  def new
    @category = Category.new
  end

  def create
    category_params = params.require(:category).permit(:name)
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path,notice:"カテゴリーを作成しました。"
    else
      render "new"
    end
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
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
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice:"カテゴリーを削除しました。"
  end


end
