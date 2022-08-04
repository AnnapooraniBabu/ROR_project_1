class CartsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def cart
  end
end
