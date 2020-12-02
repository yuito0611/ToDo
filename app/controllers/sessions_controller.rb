class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :categories
    else
      flash.alert = "名前とパスワードが一致しません。"  
      redirect_to :root 
    end
    
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
