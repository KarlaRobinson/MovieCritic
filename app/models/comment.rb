class Comment < ApplicationRecord
  # belongs_to :user
  belongs_to :movie

  validates :subject, presence: true, :length => { maximum: 100 }
  validates :body, presence: true, :length => { maximum: 800 }
end
