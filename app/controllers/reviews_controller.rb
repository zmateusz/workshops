class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :is_owner?, only: :destroy

  expose(:review)
  expose(:product)
  expose(:category)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :user_id)
    end

  def is_owner?
    if review.user != current_user
      flash[:error] = "You are not allowed to destroy this review."
      redirect_to category_product_url(category, product) and return
    end
  end
end
