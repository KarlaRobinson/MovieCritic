class User < ApplicationRecord
  has_secure_password
  has_many :movies, :dependent => :nullify

  validates :name, presence: true, :length => { maximum: 100 }
  validates :name, format: { with: /\A[a-z\s]+\Z/i,
    message: "only allows letters" }

  validates :email, presence: true, uniqueness: true, email: true

  validates :password, presence: true, :length => { minimum: 6, maximum: 10 }
end
