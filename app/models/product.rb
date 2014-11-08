class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    r=0
    reviews = self.reviews
    reviews.each do |x|
      r+=x.rating
    end
    if reviews.count != 0
      (r/reviews.count.to_f).round(1)
    else
      0.0
    end
  end
end
