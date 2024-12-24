class Admin::TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]
  
    # GET /admin/teams
    def index
      @teams = Team.includes(:members).all
    end
  
    # GET /admin/teams/:id
    def show
    end
  
    # GET /admin/teams/new
    def new
      @team = Team.new
      @team.members.build
    end
  
    # POST /admin/teams
    def create
      @team = Team.new(team_params)
      if @team.save
        redirect_to admin_team_path(@team), notice: 'Team created successfully.'
      else
        render :new, alert: 'Failed to create the team.'
      end
    end
  
    # GET /admin/teams/:id/edit
    def edit
    end
  
    # PATCH/PUT /admin/teams/:id
    def update
      if @team.update(team_params)
        redirect_to admin_team_path(@team), notice: 'Team updated successfully.'
      else
        render :edit, alert: 'Failed to update the team.'
      end
    end
  
    # DELETE /admin/teams/:id
    def destroy
      @team.destroy
      redirect_to admin_teams_path, notice: 'Team deleted successfully.'
    end
  
    private
  
    def set_team
      @team = Team.find(params[:id])
    end
  
    def team_params
      params.require(:team).permit(:name, :leader_phone, :idea_description, :request_add_member, members_attributes: [:id, :name, :email, :role, :competence, :_destroy])
    end
  end
  