class PaymentsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def payment
  end
  def add_card
    
    card = CardDetail.new(card_params, user_id: session[:current_user_id])
 if card.save
  render plain: true
  else 
    render plain: false
  end


  end

  private
  def card_params
    params.require(:card).permit(:card_holder_name, :card_no, :card_year, :card_cvv_no)
    
  end
end

