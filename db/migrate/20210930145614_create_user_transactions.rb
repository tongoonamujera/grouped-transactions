class CreateUserTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_transactions do |t|
      t.string :name
      t.decimal :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
