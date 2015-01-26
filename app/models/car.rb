class Car < ActiveRecord::Base
  has_many :rents, dependent: :destroy
  
  validates :name, :about, :presence => true
  validates :name, length: {minimum: 3}

end
