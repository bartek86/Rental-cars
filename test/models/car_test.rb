require 'test_helper'

class CarTest < ActiveSupport::TestCase
  
  
  def setup
    @car = Car.new(name: "Auto", about: "o aucie", comfort: "A")
  end
 
  test "should be valid" do
    assert @car.valid?
  end
  
  test "name should be present" do
    @car.name = "  "
    assert_not @car.valid?
  end
  
  test "about present" do
    @car.about = "  "
    assert_not @car.valid?
  end
  
  test "comfort should be present" do
    @car.comfort = " "
    assert_not @car.valid?
  end
  
  test "name length" do
    @car.name = "a"*2
    assert_not @car.valid?
  end
  
  
end
