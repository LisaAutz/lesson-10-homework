class Restaurant < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
 
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :postal_code, presence: true
  validates :neighborhood, presence: true
  validates_associated :restaurant_categories
  # validate :has_one_category_at_least

  # def has_one_category_at_least
  #   if category_ids.empty?
  #     errors.add(:categories, "need one category at least")
  #   end

  # validates category_ids: [], presence: true
  # validates category_ids: [], uniqueness: {case_sensitive: false}
  # Character must have an associated universe to be valid

end

