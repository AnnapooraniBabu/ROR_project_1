# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new; end

  def create
    user = User.new(register_params)
    if user.save
      session[:current_user_id] = user.id
      flash[:notice] = 'User Created!'
      redirect_to root_path
    else
      render plain: 'Failed to create account!'
    end
  end

  private

  def register_params
    params.require(:user).permit(:name, :email, :password, :number)
    # params.require(:todo).permit(:task,:date_task)
  end
end
