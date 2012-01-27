class CreateBillexpensedetails < ActiveRecord::Migration
  def change
    create_table :billexpensedetails do |t|
      
      t.references :billexpense
      t.column :billNo, :integer
      t.column :billDate, :Date
      t.column :expenseTypeId, :integer
      t.column :amount, :float
      t.timestamps
    end
    add_index :billexpensedetails, :billexpense_id
  end
end
