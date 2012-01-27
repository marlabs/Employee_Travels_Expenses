class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
       t.column :projid, :integer
      t.column :name, :string
    end
  end
end
