class Actor < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true, :length => { :maximum => 100 }
  validates :role, :length => { :maximum => 100 }
end
