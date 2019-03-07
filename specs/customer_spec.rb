require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("John", 25,  64, 10)
    @customer2 = Customer.new("Ruby", 100, 17, 0)

    @drink1 = Drink.new("Vodka", 3, 8)
    @drink2 = Drink.new("Gin", 5, 8)
    @drink3 = Drink.new("Beer", 2, 4)

    @pub = Pub.new("The Drunken Pirate", 20, @all_drinks)

    @food1 = Food.new("Nachos", 1, 2)
    @food2 = Food.new("Chips", 2, 4)
    @food3 = Food.new("Burger", 5, 6)
  end

  def test_customer_class_works()
    assert_equal(Customer, @customer1.class)
  end

  def test_customer_name()
    assert_equal("John", @customer1.name)
  end

  def test_amount_customer_wallet()
    assert_equal(25, @customer1.amount_cash_in_wallet)
  end

  def test_customer_buys_drink
    @customer1.buys_drink(@drink2)
    assert_equal(20, @customer1.amount_cash_in_wallet)
    @pub.add_money_given_by_customer_to_till(@drink2)
    assert_equal(25, @pub.amount_cash_in_till)
  end

  def test_drunkenness_level()
      @customer1.downs_drink(@drink2)
      assert_equal(18, @customer1.drunkenness)

  end

  def test_customer_buys_food
    @customer1.buys_food(@food2)
    assert_equal(23, @customer1.amount_cash_in_wallet)
    # @pub.add_money_given_by_customer_to_till(@drink2)
    # assert_equal(25, @pub.amount_cash_in_till)
  end

  def test_sober_up
    @customer1.eat_food(@food3)

    assert_equal(4, @customer1.drunkenness)

  end

end
