class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
         t.column :name, :string
         t.column :empid, :integer
         t.column :deptid, :integer
         t.column :projectid, :integer
         t.column :raid, :integer
         t.column :email, :string
         t.column :created_at, :timestamp
    end
  end
end
