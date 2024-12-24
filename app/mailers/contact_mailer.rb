class ContactMailer < ApplicationMailer
    def contact_email(first_name, last_name, sender_email, message)
      @first_name = first_name
      @last_name = last_name
      @sender_email = sender_email
      @message = message
  
      mail(
        to: 'jemskedjar@gmail.com',
        from: sender_email,
        subject: 'New Contact Form Submission'
      )
    end
  end
  