class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions
  has_many :user_transactions, through: :group_transactions

  validates_format_of :name, with: /^[-a-z]+$/
  validates :name,
            presence: true,
            length: { minimum: 6, maximum: 25 }
end
