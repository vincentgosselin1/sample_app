class UsersController < ApplicationController

  def new
  	@user = User.new
  	@title = "Sign up"
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the sample app!"
  		redirect_to @user
  	else
  		@title = "Sign up"
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, 
  								 :password_confirmation)
  end

end



































