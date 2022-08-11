class PaymentsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def payment
  end
end
