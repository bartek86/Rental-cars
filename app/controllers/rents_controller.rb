class RentsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @rent = @car.rents.create(rent_params)
    
    if @car.save
      redirect_to car_path(@car), :notice => "Rent created"
    else
       redirect_to car_path(@car), :notice => "Wrong rent data"
    end
    
  end
  
  def destroy
    @car = Car.find(params[:car_id])
    @rent = @car.rents.find(params[:id])
    @rent.destroy
    redirect_to car_path(@car)
    flash[:success] = "Rent destroyed"
  end
 
  private
    def rent_params
      params.require(:rent).permit(:client, :from_date, :to_date)
    end
end
