class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_transactions
  has_many :groups

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 6, maximum: 20 }
end
