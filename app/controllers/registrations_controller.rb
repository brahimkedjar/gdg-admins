class RegistrationsController < ApplicationController
    def create
      if registration_params[:is_team]
        @team = Team.new(
          name: registration_params[:team_name],
          leader_phone: registration_params[:leader_phone],
          idea_description: registration_params[:idea_description],
          request_add_member: registration_params[:request_add_member] # Adding the checkbox field
        )
  
        if @team.save
          puts "Team saved successfully: #{@team.inspect}"
  
          registration_params[:members].each do |member_params|
            puts "Creating member: #{member_params.inspect}"
            member = @team.members.create(
              name: member_params[:name],
              email: member_params[:email],
              role: member_params[:role],
              competence: member_params[:competence]
            )
            puts "Created member: #{member.inspect}"
          end
  
          render json: { message: 'Team registration successful!' }, status: :ok
        else
          render json: { errors: @team.errors.full_messages }, status: :unprocessable_entity
        end
      else
        @individual = Individual.new(
          name: registration_params[:members][0][:name],
          email: registration_params[:members][0][:email],
          role: registration_params[:members][0][:role],
          competence: registration_params[:competence]
        )
  
        if @individual.save
          render json: { message: 'Individual registration successful!' }, status: :ok
        else
          render json: { errors: @individual.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  
    private
  
    def registration_params
      params.require(:registration).permit(
        :is_team, 
        :team_name, 
        :leader_phone, 
        :idea_description, 
        :competence, 
        :request_add_member, 
        members: [:name, :email, :role, :competence]
      )
    end
  end
  