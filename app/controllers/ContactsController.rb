class ContactsController < ApplicationController
    def create
      first_name = params[:first_name]
      last_name = params[:last_name]
      email = params[:email]
      message = params[:message]
  
      Rails.logger.info "Received params: #{params.inspect}" # Debugging log
  
      ContactMailer.contact_email(first_name, last_name, email, message).deliver_now
  
      render json: { message: 'Your message has been sent successfully!' }, status: :ok
    rescue StandardError => e
      Rails.logger.error "Error sending email: #{e.message}"
      render json: { error: 'Failed to send message', details: e.message }, status: :unprocessable_entity
    end
  end
  