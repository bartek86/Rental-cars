class RentsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @rent = @car.rents.create(rent_params)
    redirect_to car_path(@car)
  end
 
  private
    def rent_params
      params.require(:rent).permit(:client, :from_date, :to_date)
    end
end
