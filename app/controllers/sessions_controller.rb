class SessionsController < ApplicationController


  def create
    if user = User.authenticate(params[:username], params[:password])
	session[:user_id] = user.id
       session[:user_name] = user.username
	redirect_to chats_path, :notice => "Logged in successfully"
    else
	flash.now[:alert] = "Invalid login/password combination"
	render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
end
