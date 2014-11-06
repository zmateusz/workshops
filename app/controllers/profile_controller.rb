class ProfileController < ApplicationController

  expose(:user)
  
  def show
    user = User.find(params[:id])
    @reviews = user.reviews.order(created_at: :desc).limit(5).decorate
  end
end
