class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @broomstick = Broomstick.find(params[:broomstick_id])
  end

end
