class Employee < ActiveRecord::Base
  has_many :billexpenses, :class_name =>"Billexpense"
  has_one :department
  has_one :department, :class_name => "Department", :foreign_key => "deptid"
           
  belongs_to :project
  belongs_to :project, :class_name => "Project", :foreign_key => "projectid"
end
