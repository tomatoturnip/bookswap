class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
  end

  private

  def set_location
    @location = Location.find(params[:id])
    if @location.save
      redirect_to @location, notice: 'Location was successfully created'
    else
      redirect_to new_location_path, notice: 'Please put a valid location'
    end
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end
end
