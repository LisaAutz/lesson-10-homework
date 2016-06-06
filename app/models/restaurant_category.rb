class RestaurantCategory < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category

  # validates_uniqueness_of :restaurant_id, :scope => :category_id

  validates :category_id, :uniqueness => {:scope=>:restaurant_id}
end
