class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    r=0
    n=0
    reviews = self.reviews
    reviews.each do |x|
      n+=1
      r+=x.rating
    end
    return (r/n.to_f).round(2)
  end
end
