class Movie < ApplicationRecord
  belongs_to :user
  has_many :actors
  has_many :comments


  validates :title, :director, presence: true, :length => { maximum: 50 }

  validates_presence_of :genre, :prod_year, :rating
  validates_inclusion_of :genre, in: %w(comedy drama international romcom horro suspense classic)
  validates :prod_year, :numericality => { greater_than_or_equal_to: 1870, less_than: 2019 }
  validates_inclusion_of :rating, in: [1, 2, 3, 4, 5]
end
