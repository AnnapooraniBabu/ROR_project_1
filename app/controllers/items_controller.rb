class ItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def show
    # @items = Item.all.map do |values|
    #   values
    # @items = Item.select('img_url,item_name, quantity, price').where(category: 'snacks')
    # end
    # @items
    # @show_data = Todo.all.map do |todolist|
    #   todolist
    # end
    # @show_data
  end
  def snacks
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'snacks')
   render 'items/show', locals: { items:  @items}

  end
  def papads_fryums
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'papads&fryums')
   render 'items/show', locals: { items:  @items}

  end
  def healthmix
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'healthmix')
   render 'items/show', locals: { items:  @items}

  end
  def sweets
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'sweet')
   render 'items/show', locals: { items:  @items}

  end
  def jaggerysweets
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'jaggery')
   render 'items/show', locals: { items:  @items}

  end
  def pickles
    @items = Item.select('img_url,item_name, quantity, price').where(category: 'pickle')
   render 'items/show', locals: { items:  @items}

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
