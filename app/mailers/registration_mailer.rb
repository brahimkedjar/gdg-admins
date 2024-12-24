class RegistrationMailer < ApplicationMailer
  def thank_you_email(email)
    mail(
      to: email,
      from: 'gdgsetif@gmail.com', 
      subject: 'Thank You for Registering!'
    )
  end
end
