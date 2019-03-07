require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestDrink < Minitest::Test

  def setup
    @pub = Pub.new("The Drunken Pirate", 20, [@drink1, @drink2, @drink3])

    # @all_drinks = do this for pub_spec
    @drink1 = Drink.new("Vodka", 3, 8)
    @drink2 = Drink.new("Gin", 5, 8)
    @drink3 = Drink.new("Beer", 2, 4)

    @food1 = Food.new("Nachos", 1, 2)
    @food2 = Food.new("Chips", 2, 4)
    @food3 = Food.new("Burger", 5, 6)
  end

  def test_drink_class_works()
    assert_equal(Drink, @drink1.class)
  end

  def test_drink_name()
    assert_equal("Vodka", @drink1.name)
  end

  def test_drink_price()
    assert_equal(5, @drink2.price)
  end


end
