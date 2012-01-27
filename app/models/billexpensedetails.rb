class Billexpensedetails < ActiveRecord::Base
  belongs_to :billexpense, :class_name => "Billexpense", :foreign_key => "billexpense_id"
end
