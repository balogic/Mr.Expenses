class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :amount
      t.string :purchase

      t.timestamps null: false
    end
  end
end
