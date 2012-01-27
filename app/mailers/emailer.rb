class Emailer < ActionMailer::Base
  default from: "HRIS@marlabs.com"
  def send_email(employee,manager,billexpense)
    @employee=employee
    @manager=manager
    @billexpense=billexpense
    mail(:to => @manager.email, :cc => @employee.email, :subject => "#{@employee.name} - #{@billexpense.grandTotal} - For YourApproval")
  end
  
  def approve_email(employee,manager,billexpense)
    @employee=employee
    @manager=manager
    @billexpense=billexpense
    mail(:to => @employee.email, :cc =>@manager.email, :subject => "Claim ID:#{@billexpense.claimPrefix}#{@billexpense.id}  Claim Amount:#{@billexpense.grandTotal} - Approved")
  end 
  
  def reject_email(employee,manager,billexpense)
   @employee=employee
   @manager=manager
   @billexpense=billexpense
   mail(:to => @employee.email, :cc =>@manager.email, :subject => "Claim ID:#{@billexpense.claimPrefix}#{@billexpense.id}  Claim Amount:#{@billexpense.grandTotal} - Rejected")
  end 
end
