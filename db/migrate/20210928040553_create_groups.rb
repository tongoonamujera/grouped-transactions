class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # create_table :user_transactions do |t|
    #   t.string :name
    #   t.decimal :amount
    #   t.references :author, null: false, index: true, foreign_key: { to_table: :users }

    #   t.timestamps
    # end

    # create_table :group_transactions do |t|
    #   t.references :user_transaction, null: false, foreign_key: true
    #   t.references :group, null: false, foreign_key: true

    #   t.timestamps
    # end
  end
end

