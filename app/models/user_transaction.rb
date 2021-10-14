class UserTransaction < ApplicationRecord
  belongs_to :user

  has_many :group_transactions, dependent: :delete_all
  has_many :groups, through: :group_transactions

  validates :amount, numericality: true
  validates :name,
            presence: true,
            length: { minimum: 6, maximum: 25 }

  def update_payment
    self.update_attributes(is_paid: true)
  end
end
