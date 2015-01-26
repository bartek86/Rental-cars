class Car < ActiveRecord::Base
  has_many :rents
  
  validates :name, :about, :presence => true
  validates :name, length: {minimum: 3}

end
