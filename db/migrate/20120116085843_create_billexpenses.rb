class CreateBillexpenses < ActiveRecord::Migration
  def change
    create_table :billexpenses do |t|
      
      t.column :billexpid, :integer
      t.column :claimPrefix, :string, :length=>3
      t.column :empid, :integer
      t.column :approverid, :integer 
      t.column :attachLocation, :string, :length=>500
      t.column :clientBillable, :boolean
      t.column :remarks, :string
      t.column :approved, :integer
      t.column :travelFromDate, :date
      t.column :travelToDate, :date
      t.column :grandTotal, :float
      t.column :filename, :string
      t.column :content_type, :string
      t.column :data, :binary
      
      t.timestamps
    end
  end
end
