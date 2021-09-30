class GroupTransaction < ApplicationRecord
  belongs_to :transaction
  belongs_to :group
end
