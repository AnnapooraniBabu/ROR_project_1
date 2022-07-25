class ItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def show
    @items = Item.all.map do |values|
      values
    end
    @items
    # @show_data = Todo.all.map do |todolist|
    #   todolist
    # end
    # @show_data
  end
  def create
    item = Item.new(item_params)
    if item.save
      session[:current_item_id] = item.id
      # flash[:notice]= "User Created!"
      render plain: 'Saved'
      # redirect_to 'show'
    else
    render plain: 'Failed to create account!'
    end
  end

  private
  def item_params
    params.require(:item).permit(:img_url, :item_name, :quantity, :price)
  end
end
