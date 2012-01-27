class Department < ActiveRecord::Base
  has_many :employee
end
