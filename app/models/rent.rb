class Rent < ActiveRecord::Base
  belongs_to :car
  validates :from_date, :to_date, :presence => true
  before_validation :available, :on => :create
  
  validates :client, length: {minimum: 3}, :presence => true
  validates_datetime :from_date, :on => :create, :on_or_after => :now
  validates_datetime :to_date, :on => :create, :after => :from_date


  def available
    @car = Car.find(self.car_id)
    rented = @car.rents.where("(from_date <= :from_date and to_date >= :from_date) or (from_date <= :to_date and to_date >= :to_date)",
                                      {:from_date => self.from_date, :to_date => self.to_date}).count
    
    return(rented == 0)
  end
  
end
