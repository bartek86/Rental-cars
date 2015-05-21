class Car < ActiveRecord::Base
  belongs_to :user
  has_many :rents, dependent: :destroy
  
  validates :name, :about, :comfort, :presence => true
  validates :name, length: {minimum: 3}

end
