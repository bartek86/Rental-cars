class Car < ActiveRecord::Base
  
  validates :name, :about, :presence => true
  validates :name, length: {minimum: 3}

end
