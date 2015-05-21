class CarsController < ApplicationController
  
  before_action :authenticate_user!, except:[:index, :show]
  
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find(params[:id])
  end
  
  def new
    @car = current_user.cars.build
  end
  
  def create
    @car = current_user.cars.build(cars_params)
    
    if @car.save
      redirect_to cars_path
      flash[:success] = "New car added!"
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
      redirect_to cars_path
      flash[:success] = "Car updated!"
      #:notice => "Car updated"
    else
      render "edit"
    end
  end
  
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
    flash[:success] = "Car deleted!"
  end
  
    private 
  
    def cars_params
      params.require(:car).permit(:name, :about, :comfort)
    end
end
