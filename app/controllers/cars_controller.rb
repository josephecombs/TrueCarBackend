class CarsController < ApplicationController
  
  def index
    if params[:serial_number_pattern]
      if params[:serial_number_pattern] == "ALLALL000000"
        @cars = Car.all
      else
        @cars = Car.regexed_search(params[:serial_number_pattern])
      end
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
