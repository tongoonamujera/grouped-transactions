class GroupTransaction < ApplicationRecord
  belongs_to :group, dependent: :nullify
  belongs_to :user_transaction, dependent: :nullify
end
