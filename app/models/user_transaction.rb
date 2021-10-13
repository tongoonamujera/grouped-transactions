class UserTransaction < ApplicationRecord
  belongs_to :user

  has_many :group_transactions, dependent: :destroy
  has_many :groups, through: :group_transactions

  validates :amount, numericality: true
  validates :name,
            presence: true,
            length: { minimum: 6, maximum: 25 }
end
