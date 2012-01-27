class Billexpense < ActiveRecord::Base
  belongs_to :employee, :class_name => "Employee", :foreign_key => "empid"
  has_many :billexpensedetails, :class_name => "Billexpensedetails", :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :billexpensedetails, :allow_destroy => true
  
  validates_presence_of :travelFromDate,:travelToDate, :message => "can't be empty"
  
  #before_save :validateRecord
 
 
 
  def uploaded_file=(incoming_file)
        self.filename = incoming_file.original_filename
        self.content_type = incoming_file.content_type
        self.data = incoming_file.read
    end

    def filename=(new_filename)
        write_attribute("filename", sanitize_filename(new_filename))
    end

    private
    def sanitize_filename(filename)
        #get only the filename, not the whole path (from IE)
        just_filename = File.basename(filename)
        #replace all non-alphanumeric, underscore or periods with underscores
        just_filename.gsub(/[^\w\.\-]/, '_')
    end
    
    #validating the record before saving into database
    def validateRecord
      puts "validateRecord"
      # @fromDate=params[:travelFromDate]
      # @toDate=params[:travelToDate]
      # @expenses=Expense.all
      # @expenses.each do |exp|
        # if((@fromDate >= exp.travelFromDate & @fromDate <= exp.travelToDate)|
           # (@toDate >= exp.travelFromDate & @toDate <= exp.travelToDate)|
           # (exp.travelFromDate >= @fromDate & exp.travelFromDate <= @toDate)|
           # (exp.travelToDate >= @fromDate & exp.travelToDate <= @toDate))
           # return false
        # else
          # return true
        # end
      # end
   end

end
