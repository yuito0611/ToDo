class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user] = User.new()
      session[:user][:id] = user.id
      session[:user][:name] = user.name
      redirect_to :categories
    else
      flash.alert = "名前とパスワードが一致しません。"  
      redirect_to :root 
    end
    
  end

  def destroy
    session.delete(:user)
    redirect_to :root
  end
end
