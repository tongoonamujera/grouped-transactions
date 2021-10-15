class GroupTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :user_transaction
end
