class CreateExpensetypes < ActiveRecord::Migration
  def change
    create_table :expensetypes do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
