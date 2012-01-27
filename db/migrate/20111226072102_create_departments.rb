class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|

      t.column :deptid, :integer
      t.column :name, :string
    end
  end
end
