# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :verify_authenticity_token
  def new; end

  def create
    # skip_before_action :verify_authenticity_token
    # skip_before_filter :verify_authenticity_token
    # user_params = params.permit(:email, :password)
    user = User.find_by(email: register_params[:email])
    # puts '---------------------------------------------njsndjn----------'
    # puts (params[:password])
    if user&.authenticate(register_params[:password])
      session[:current_user_id] = user

      flash.now[:alert] = 'Logged in successfully'
      redirect_to main_path
    else
      flash.now[:alert] = 'Login is invalid!'
      render 'new'
      # redirect_to '/login'
      # render plain: false
    end
  end

  # def destroy
  #   puts session[:user_id]
  #   session[:user_id]=nil
  #   flash[:notice] ="You have been logged out!"
  #   redirect_to root_path
  # end
  def destroy
    session[:current_user_id] = nil
    puts "  session[:current_user_id] is #{session[:current_user_id]}"
    redirect_to root_path
  end

  private

  def register_params
    params.require(:user).permit(:email, :password)
    # params.require(:todo).permit(:task,:date_task)
  end
end
