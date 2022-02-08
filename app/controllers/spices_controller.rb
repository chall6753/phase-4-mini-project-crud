class SpicesController < ApplicationController

    def index 
        spices = Spice.all
        render json: spices
    end
    def create
        spice = Spice.create(spice_params)
        
        render json: spice, status: :created
    end
    def update
        spice = Spice.find_by(id: params[:id])
        if spice 
            render json: spice.update(spice_params), status: :accepted
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end
    def destroy 
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            render json: {}
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end
    private
    def spice_params
        params.permit(:title,:image,:descritpion,:notes,:rating)
    end
    
end
