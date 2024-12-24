class Admin::IndividualsController < ApplicationController
    before_action :set_individual, only: [:show, :destroy]
  
    # GET /admin/individuals
    def index
      @individuals = Individual.all
    end
  
    # GET /admin/individuals/:id
    def show
    end
  
    # DELETE /admin/individuals/:id
    def destroy
      @individual.destroy
      redirect_to admin_individuals_path, notice: 'Individual deleted successfully.'
    end
  
    private
  
    def set_individual
      @individual = Individual.find(params[:id])
    end
  end
  