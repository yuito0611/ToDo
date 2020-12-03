class UsersController < ApplicationController
  before_action :login_required

  #ユーザー一覧
  def index
    @users = User.order("id")
  end

  #ユーザー情報の詳細
  def show
    @user = User.find(params[:id])
  end

  #新規作成
  def new
    @user = User.new()
  end

  #編集
  def edit
    @user = User.find(params[:id])
  end

  #ユーザーの新規登録
  def create
    category_params = params.require(:user).permit(:name,:full_name,:email,:birthday,:sex,:administrator,:password)
    @user = User.new(category_params)
    if @user.save
      redirect_to @user,notice:"ユーザーを登録しました。"
    else
      render "new"
    end
  end

  #ユーザー情報の更新
  def update
    category_params = params.require(:user).permit(:name,:full_name,:email,:birthday,:sex,:administrator,:password)
    @user = User.find(params[:id])
    @user.assign_attributes(category_params)
    if @user.save
      redirect_to @user
    else
      render "edit"
    end
  end

  #ユーザーの削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users
  end
end
