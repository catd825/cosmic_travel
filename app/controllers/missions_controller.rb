class MissionsController < ApplicationController

    def new
        @mission = Mission.new
        @scientists = Scientist.all
        @planets = Planet.all
    end

    def create
        @mission = Mission.create(mission_params)
        # byebug
        @scientist = @mission.scientist_id

        if @mission.valid?
            flash[:success] = "Successfully created mission #{@mission.name}"
            redirect_to scientist_path(@scientist)
          else 
            flash[:my_errors] = @mission.errors.full_messages
            redirect_to new_mission_path 
          end 
    end

    private
    def mission_params
        params.require(:mission).permit(:name, :scientist_id, :planet_id)
    end
end