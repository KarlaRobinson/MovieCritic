class Movie < ApplicationRecord

  def self.genre
    %w(comedy drama international romcom horror suspense classic)
  end

  belongs_to :user
  has_many :actors, :dependent => :nullify
  has_many :comments, :dependent => :nullify

  validates :title, :director, presence: true, :length => { maximum: 100 }

  validates_presence_of :genre, :prod_year, :rating
  validates_inclusion_of :genre, { in: self.genre,
    message: "must be one of the following: #{self.genre.join(', ')}." }
  validates :prod_year, :numericality => 
    { greater_than_or_equal_to: 1870, less_than_or_equal_to: Time.current.year }
  validates_inclusion_of :rating, in: [1, 2, 3, 4, 5]
end
