class EmployeeTravelExpensesController < ApplicationController
  def mainpage
    
  end
  def index
    @viewflag=false;
    #take id based on login id
    id=1
    @employee = Employee.find(id)
 end
 
 def create
   @id=1
   @employee = Employee.find(@id)
   puts "#######################"
   length=params[:maxLine][:hiddenarray]
   $num=length.to_i
   @expense=params[:billexpense]
   file=params[:billexpense][:filename]
   puts file
  filename=file.original_filename
  puts filename
   @filedata = file.read
   puts @filedata
      
   #@billexpense=params[:billexpense]
   #@billexpense.data=@filedata
   billexpense=Billexpense.new do |billexpense|
     billexpense.data= @filedata
     billexpense.filename=filename
     billexpense.travelFromDate=(params[:billexpense][:travelFromDate]).to_date
     billexpense.travelToDate=(params[:billexpense][:travelToDate]).to_date
     billexpense.approverid=@employee.raid
     billexpense.empid=@id
     billexpense.approved=@id
     billexpense.clientBillable=params[:radio]
     billexpense.grandTotal=params[:billexpense][:grandTotal]
     billexpense.claimPrefix='CL'
     i=1
     while i <=  $num  do
        puts params["billExpenses_billNo#{i}"]
        billexpense.billexpensedetails.build do |details|
           if((params["billExpenses_billNo#{i}"]!=nil) && (params["billExpenses_billDate#{i}"]!=nil)&&(params["select#{i}"]!=nil)&&(params["billExpenses_amount#{i}"]!=nil))
            details.billNo=params["billExpenses_billNo#{i}"]
            details.billDate=params["billExpenses_billDate#{i}"]
            details.expenseTypeId=params["select#{i}"]
            details.amount=params["billExpenses_amount#{i}"]
            i=i+1
          end
        end  
     end
   end
  # raise billexpense.inspect
    if billexpense.save
      #@employee.email and name
      loginId=1
      @employee=Employee.find(loginId)
      @manager=Employee.find(@employee.raid)
      begin
        Emailer.send_email(@employee,@manager,billexpense).deliver
        redirect_to root_url, :notice => "Email has been sent to manager successfully!"
      rescue
      end 
    end   
   render :action => 'mainpage'  
  
 end  #create method end
 
 def view
   @viewflag=true;
   puts 'before printing id'
   billexpid =params[:idvalue]
   @billexpenses =Billexpense.find(billexpid)
   @employee = Employee.find(@billexpenses.empid)
   puts @billexpenses.claimPrefix
   render "index"    
  end

  def view_picture
    expid =params[:id]
    puts 'before printing value'
    puts expid
    @billexpenses =Billexpense.find(expid)
       
    binarydata = @billexpenses.data
    # image.format = "plain/txt"
    #send_data(image, :disposition => 'inline',:type => 'text/html',:filename => 'abc.txt')
    ##send_file image,:type => 'text/html',:disposition => 'inline'
  
    send_data(binarydata, :filename => @billexpenses.filename,:disposition => 'attachment')
  end
  
  def generate_report
    
  end
  
end
