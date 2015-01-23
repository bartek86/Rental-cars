class CarsController < ApplicationController
  
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find(params[:id])
  end
  
  def new
    @car = Car.new
  end
  
  def create
    @car = Car.new(cars_params)
    
    if @car.save
      redirect_to cars_path, :notice => "Car saved"
    else
      render "new"
    end
  end
  
  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    @car = Car.find(params[:id])
    
    if @car.update_attributes(cars_params)
      redirect_to cars_path, :notice => "Car updated"
    else
      render "edit"
    end
  end
  
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, :notice => "Car deleted"
  end
  
    private 
  
    def cars_params
      params.require(:car).permit(:name, :about, :comfort)
    end
end
