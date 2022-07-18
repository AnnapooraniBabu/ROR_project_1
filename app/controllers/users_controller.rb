class UsersController < ApplicationController
    def login
    
    end
 
    def create
      # skip_before_action :verify_authenticity_token
      user_params = params.permit(:email, :password)
      @user = Register.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        user[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully"
      else
      flash[:notice] = "Login is invalid!"
      render 'new'
      # redirect_to new_user_path
      end
    end

    def destroy

      user[:user_id]=nil
      flash[:notice] ="You have been logged out!"
      redirect_to root_path
      
    end

  end
  

