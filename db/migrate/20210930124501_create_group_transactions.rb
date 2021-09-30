class CreateGroupTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :group_transactions do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
