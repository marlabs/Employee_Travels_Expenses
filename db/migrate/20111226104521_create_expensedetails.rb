class CreateExpensedetails < ActiveRecord::Migration
  def change
    create_table :expensedetails do |t|

    t.references :expense
    t.column :description, :string, :length=>32
   t.column :expDate, :date
   t.column :travelExp, :float
   t.column :localConvey, :float
   t.column :perDiem, :float
   t.column :lodgingExp, :float
   t.column :mealsExp, :float
   t.column :clientEntmnt, :float
   t.column :telephoneExp, :float
   t.column :miscExp, :float
   t.column :totalExp, :float
   t.column :compPaid, :float
   t.column :totalClaim, :float 
   
    end
    add_index :expensedetails, :expense_id
  end
end
