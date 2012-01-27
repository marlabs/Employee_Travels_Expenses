class ManagerReviewController < ApplicationController
  def mainpage
    
  end
  def manager_review
    loginid=2
    @billexpenses=Billexpense.find(:all,:conditions => "approverid = #{loginid} AND approved = 1")
    render "managerReview"
  end
  
  def manager_approval
    
      checkedids = params[:checkedids]
      checkedids.each do |thing|  
       @billexpenses = Billexpense.find(thing)
       puts thing
       $x=thing
       @employee=Employee.find(@billexpenses.empid)
       loginId=2
       @manager=Employee.find(loginId)
       
       if(params["textarea#$x"]!=nil)
        @billexpenses.update_attribute(:remarks, params["textarea#$x"])
       end
        if (@billexpenses.update_attribute(:approved ,3))
         #Employee email 
         begin
           Emailer.approve_email(@employee,@manager,@billexpenses).deliver         
           redirect_to root_url, :notice => "Approval notification has been sent successfully!"
         rescue 
               
         end
         
        end
       end
  render :action => 'mainpage' 
  end
  
  def manager_rejection
    checkedids = params[:checkedids] 
    checkedids.each do |thing|      
     @billexpenses = Billexpense.find(thing)
      $x=thing
     @employee=Employee.find(@billexpenses.empid)
     loginId=2
     @manager=Employee.find(loginId)
     
     #@billexpenses.update_attribute(:remarks, params["textarea#$x"])
     @billexpenses.update_attribute(:remarks, params["textarea#$x"])
     if (@billexpenses.update_attribute(:approved ,2))
      #Employee email 
      #@employee=Employee.find(1)
      begin
        Emailer.reject_email(@employee,@manager,@billexpenses).deliver
        redirect_to root_url, :notice => "Rejection notification has been sent successfully!"
      rescue 
            
      end
      
     end
    end 
 render :action => 'mainpage'  
end

end
