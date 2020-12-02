class UsersController < ApplicationController

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
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user,notice:"ユーザーを登録しました。"
    else
      render "new"
    end
  end

  #ユーザー情報の更新
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
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
