class UsersController < ApplicationController
  def show
    @user = current_user
    @villas = Villa.where(user_id: @user.id)
  end
end
