class PaymentsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def payment
   
  end
  def add_card
    
    

  end
  def address
    
  end
  def create_card
    current_user = session[:current_user_id]
    # p '============================'
    # p '============================'
    # p '============================'
    # p card_params
    card = CardDetail.new(card_params)
    card.user_id = current_user['id']
 if card.save
  # render plain: true
  redirect_to '/payment'
  else 
    render plain: false
  end

  end

  private
  def card_params
    params.require(:card).permit(:card_holder_name, :card_no, :card_year, :card_cvv_no)
    
  end
end

