class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :nick_name
      t.string :bank_name
      t.integer :current_bal
      t.integer :min_payment
      t.integer :actual_payment
      t.integer :last_four_acct
      t.integer :payment_day
      t.belongs_to :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
