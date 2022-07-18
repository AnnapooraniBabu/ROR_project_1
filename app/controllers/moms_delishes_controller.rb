class MomsDelishesController < ApplicationController
  def index
  
  end

  def register
    @register = Register.new
  end
  def create
    @register = Register.new(register_params)
    if @register.save
      flash[:notice]= "User Created!"
      redirect_to root_path
    else
    render plain: 'Failed to create account!'
    end
  end
  def register_params
    params.require(:register).permit(:name, :email, :password_digest, :number)
    # params.require(:todo).permit(:task,:date_task)
  end
  # def check_user
  #   @user = Register.all
  #   print @user
  # end
end
