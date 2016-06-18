class ContactMailer < ApplicationMailer
  	default from: 'adib.elaraki@gmail.com'
 
  	def send_email(email)
  		@email = email
	    mail(to: @email.receiver_email, subject: email.objet)
  	end
end