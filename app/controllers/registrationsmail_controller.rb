class RegistrationsmailController < ApplicationController
  def create
    member_emails = params.dig(:registration, :members)&.map { |member| member[:email] }

    if member_emails.present?
      member_emails.each do |email|
        RegistrationMailer.thank_you_email(email).deliver_now
      end

      render json: { message: 'Emails sent successfully!' }, status: :ok
    else
      render json: { error: 'No member emails provided' }, status: :unprocessable_entity
    end
  end
end
