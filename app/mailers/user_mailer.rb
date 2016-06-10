class UserMailer < ApplicationMailer
	default from: "ana.afonso.01@gmail.com"

	def contact_form(email, name, message)
		@message = message
			mail(from: email,
				to: "ana.afonso.01@gmail.com",
				:subject => "A new contact form message from #{name}")
	end
end
