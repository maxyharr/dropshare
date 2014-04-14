class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def test_create
    user = User.test({provider: "facebook", uid: "12345", name: "Test User"})
    session[:user_id] = user.id
    redirect_to root_url
  end

end
