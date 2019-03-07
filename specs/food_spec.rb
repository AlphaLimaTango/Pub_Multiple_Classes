require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../food.rb')


class TestFood < Minitest::Test

  def setup
    @pub = Pub.new("The Drunken Pirate", 20, [@drink1, @drink2, @drink3])

    @customer1 = Customer.new("John", 25,  64, 10)
    @customer2 = Customer.new("Ruby", 100, 17, 0)

    # @all_drinks = do this for pub_spec
    @drink1 = Drink.new("Vodka", 3, 8)
    @drink2 = Drink.new("Gin", 5, 8)
    @drink3 = Drink.new("Beer", 2, 4)

    @food1 = Food.new("Nachos", 1, 2)
    @food2 = Food.new("Chips", 2, 4)
    @food3 = Food.new("Burger", 5, 6)
  end

  def test_food_class_works()
    assert_equal(Food, @food1.class)
  end

  def test_food_name()
    assert_equal("Nachos", @food1.name)
  end

  def test_food_price()
    assert_equal(2, @food2.price)
  end



end
