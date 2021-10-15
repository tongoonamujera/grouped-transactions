class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_transactions, dependent: :nullify
  has_many :groups, dependent: :nullify

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 6, maximum: 20 }
end
