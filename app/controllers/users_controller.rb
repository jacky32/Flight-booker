class UserssController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: 'Account created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @user = user.find(params[:id])
  end

  private

  def user_params
    params.require(:flight).permit(:email, :password, :password_confirmation)
  end
end
