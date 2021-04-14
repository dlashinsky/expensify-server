class CreateFixedExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_expenses do |t|
      t.string :exp_name
      t.string :exp_type
      t.integer :exp_amount
      t.string :payment_day
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
