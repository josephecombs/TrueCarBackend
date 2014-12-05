class CarsController < ApplicationController
  
  def index
    if params[:serial_number_pattern]
      @cars = Car.regexed_search(params[:serial_number_pattern])
      # @cars = [Car.first, Car.last]
    else
      @cars = Car.all
    end
    render :index
  end
  
  def show
    render :show
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
