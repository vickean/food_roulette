class PaymentsController < ApplicationController

def index
  end

  def new
  	@client_token = Braintree::ClientToken.generate
    @payment = Payment.new
  
  end


  def create

  	@num_token = params[:payment][:num_token].to_i
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      amount: "#{(15 * @num_token).to_s}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    # reserve to save the transaction details into database
    if result.success?
    	flash[:success] = 'Payment done!'
      current_user.update(spin_num: @num_token)
    	redirect_to root_path
    
    else
    	flash[:warning] = 'Error occured.'
    	redirect_to (:back)
    end
  end

 end
 