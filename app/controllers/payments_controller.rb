class PaymentsController < ApplicationController

def index
  end

  def new
  	@client_token = Braintree::ClientToken.generate
    @payment = Payment.new
  end


  def create
    @user = current_user
    @num_token2 = @user.spin_num
  	@num_token = params[:payment][:num_token].to_i
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      amount: "#{(15 * @num_token).to_s}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    # reserve to save the transaction details into database
    if result.success?
    	flash[:success] = 'Payment done!'
      @user.spin_num = @num_token2 + @num_token
      @user.save
    	redirect_to root_path

    else
    	flash[:warning] = 'Error occured.'
    	redirect_to (:back)
    end
  end

 end
