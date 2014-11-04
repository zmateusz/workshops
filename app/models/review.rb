class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, :rating, :user_id, presence: true
end
