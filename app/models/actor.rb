class Actor < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true, :length => { :maximum => 50 }
  validates :role, :length => { :maximum => 50 }
end
