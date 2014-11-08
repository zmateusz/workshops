class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :signed_in?, only: [:create, :update]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, :user_id)
  end

  def signed_in?
    unless user_signed_in?
      flash[:error] = "You are not allowed to edit this product." 
      redirect_to new_user_session_path and return
    end
  end

  def is_owner?
    if product.user != current_user
      flash[:error] = "You are not allowed to edit this product."
      redirect_to category_product_url(category, product) and return
    end
  end
end
