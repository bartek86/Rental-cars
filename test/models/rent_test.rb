require 'test_helper'

class RentTest < ActiveSupport::TestCase
 
 def setup
  @car = cars(:car2)
  @rent = @car.rents.build(client: "Client1", from_date: '2015-06-20', to_date: '2015-06-26')
 
  @rent2 = @car.rents.build(client: "Client2", from_date: '2015-06-23', to_date: '2015-06-28')
  #@rent.available
   
 end
 
  test "should be valid" do
    assert @rent.valid?
  end
  
  test "is available" do
    assert_not_equal @rent.available, 0
  end
 
  test "client should be present" do
    @rent.client = " "
    assert_not @rent.valid?
  end
  
  test "client should be 3 chr or more long" do
    @rent.client = "a"*2
    assert_not @rent.valid?
  end
  
  test "from date should be present" do
    @rent.from_date = " "
    assert_not @rent.valid?
  end
  
  test "to date should be present" do
    @rent.to_date = " "
    assert_not @rent.valid?
  end
  
  test "to date should be after from date" do
    @rent.to_date = "2017-01-01"
    @rent.from_date = "2017-02-01"
    
    assert_not @rent.valid?
  end
  
  test "from date should not be in the past" do
    @rent.from_date = DateTime.now-1
    
    assert_not @rent.valid?
  end
  #test "rent2 should not be valid" do
  #  assert_not @rent2.valid?
  #end
  
end