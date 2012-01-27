class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|

   t.column :expid, :integer
   t.column :claimPrefix, :string, :length=>3
   t.column :empid, :integer
   t.column :approverid, :integer   
   t.column :travelFromDate, :date
   t.column :travelToDate, :date
   t.column :attachLocation, :string, :length=>500
   t.column :clientBillable, :boolean
   t.column :netDue, :float
   t.column :advance, :float
   t.column :submissionDate, :date
   t.column :remarks, :string
   t.column :approved, :integer
   t.column :sumTravelExp, :float
   t.column :sumLocalConvey, :float
   t.column :sumPerDiem, :float
   t.column :sumLodgingExp, :float
   t.column :sumMealsExp, :float
   t.column :sumClientEntmnt, :float
   t.column :sumTelephoneExp, :float
   t.column :sumMiscExp, :float
   t.column :sumTotalExp, :float
   t.column :sumCompPaid, :float
   t.column :sumTotalClaim, :float
   t.column :grandTotal, :float
   
      t.column :filename, :string
      t.column :content_type, :string
      t.column :data, :binary

   
    end
  end
end
