class CarsController < ApplicationController
  
  def index
    if params[:serial_number_pattern]
      #TODO: check for bad query string in here with a regex, although it should not get to that point because we are using js to do the same thing for the user
      @cars = Car.regexed_search(params[:serial_number_pattern])
    else
      # @cars = Car.all
      @cars = []
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
