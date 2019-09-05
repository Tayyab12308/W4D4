class SessionsController < ApplicationController
    
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      log_in_user(user)
      redirect_to bands_path
    else
      flash.now[:errors] = [ "Invalid username or password" ]
      render :new
    end
  end

  def destroy
    log_out
    flash.now[:error] = [ "logged out" ]
    redirect_to bands_path
  end
end