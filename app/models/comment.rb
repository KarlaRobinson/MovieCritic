class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :subject, presence: true, :length => { maximum: 50 }
  validates :body, presence: true, :length => { maximum: 200 }
end
