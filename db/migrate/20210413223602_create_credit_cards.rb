class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :nick_name
      t.string :bank_name
      t.integer :current_bal
      t.integer :credit_limit
      t.integer :min_payment
      t.integer :actual_payment
      t.integer :last_four_card
      t.integer :payment_day
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
