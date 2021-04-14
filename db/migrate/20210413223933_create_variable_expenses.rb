class CreateVariableExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :variable_expenses do |t|
      t.string :exp_name
      t.string :exp_type
      t.integer :monthly_min
      t.integer :monthly_max
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
