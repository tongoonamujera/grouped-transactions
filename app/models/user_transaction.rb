class UserTransaction < ApplicationRecord
  belongs_to :user

  has_many :group_transactions, dependent: :delete_all
  has_many :groups, through: :group_transactions

  validates :amount, numericality: true
  validates :name,
            presence: true,
            length: { minimum: 6, maximum: 25 }
#rubocop:disable all
  def update_payment
    self.update_column(is_paid: true)
  end

  def self.archieved
    where(is_paid: false)
  end

  def self.not_archieved
    where(is_paid: true)
  end

  def archieve_payments
    self.update_column(is_paid: false)
  end
end
