class UsersController < Clearance::UsersController
  def show
   @user = User.new(params[:user])
 end

 def edit
  @user = User.find(params[:id])
 end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

 private
 def user_from_params
    user_params = params[:user] || Hash.new
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    gender = user_params.delete(:gender)
    country = user_params.delete(:country)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    #assigned those data into Clearance object
    Clearance.configuration.user_model.new(user_params).tap do |user|
    	user.first_name = first_name
    	user.last_name = last_name
    	user.gender = gender
    	user.country = country
      user.email = email
      user.password = password
    end
  end
end
