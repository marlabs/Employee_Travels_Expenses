class Expensedetails < ActiveRecord::Base
  
   belongs_to :expense
   belongs_to :expense, :class_name => "Expense", :foreign_key => "expense_id"
end
