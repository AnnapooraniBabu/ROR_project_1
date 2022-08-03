$cur_item = nil
class ItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def show
    
  end
  def snacks
    @items = Item.where(category: 'snacks')
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

  def show_selected_item
    item_id = params[:item_id]
    $cur_item = Item.find(item_id)
    render 'items/item' 

    random_items
    # User.limit(5).order("RAND()")
    # $random_val = Item.limit(5).order("RAND()")
    # puts random_val
    
  end
  def random_items
    # random_val =  Random.new
    # 5.times.map{ rand(1..10000000000) }.sort
    rand_val = 5.times.map{rand(1..15) }.sort
    # @random_item = Item.find(rand_val)
    #  locals: { random_items:   @random_item}
    # puts "Random item is #{@random_item}"
  
  
    puts "Random number is #{rand_val}"
  end
  private
  def item_params
    params.require(:item).permit(:img_url, :item_name, :quantity, :price)
  end
end
