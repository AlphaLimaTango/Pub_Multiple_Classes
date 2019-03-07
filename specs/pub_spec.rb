require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestPub < Minitest::Test

  def setup
    @pub = Pub.new("The Drunken Pirate", 20, @all_drinks, {@drink1 => 10, @drink2 => 10, @drink3 => 20})

    @all_drinks = [@drink1, @drink2, @drink3]

    @customer1 = Customer.new("John", 25,  64, 10)
    @customer2 = Customer.new("Ruby", 100, 17, 0)

    @drink1 = Drink.new("Vodka", 3, 8)
    @drink2 = Drink.new("Gin", 5, 8)
    @drink3 = Drink.new("Beer", 2, 4)

    @food1 = Food.new("Nachos", 1, 2)
    @food2 = Food.new("Chips", 2, 4)
    @food3 = Food.new("Burger", 5, 6)
  end

  def test_pub_class_works()
    assert_equal(Pub, @pub.class)
  end

  def test_pub_name()
    assert_equal("The Drunken Pirate", @pub.name)
  end

  def test_amount_cash_in_till()
    assert_equal(20, @pub.amount_cash_in_till)
  end

  def test_pub_has_drinks
    assert_equal(3, @pub.count_drinks_stock(@all_drinks))
  end

  def test_check_age_customer__legal()
    @pub.check_age_customer(@customer1)
    assert_equal(true, @customer1.am_I_legal?)
  end

  def test_check_age_customer__underage()
    @pub.check_age_customer(@customer2)
    assert_equal(false, @customer2.am_I_legal?)

  end

  def test_check_drunkenness_level()
    @pub.check_drunkenness_level(@customer1)
    assert_equal(10, @customer1.drunkenness)

  end

  def test_refuse_service__not_drunk()
    @pub.refuse_service(@customer1)
    assert_equal("What do you want?", @pub.refuse_service(@customer1))
  end

  def test_refuse_service__too_drunk()
    6.times do |x|
      @customer1.downs_drink(@drink1)
    end
    @pub.refuse_service(@customer1)
    assert_equal("You're not getting served", @pub.refuse_service(@customer1))
  end

  # def test_check_stock()
  #
  #   @pub.check_current_stock
  #   assert_equal({}, @pub.check_current_stock)
  # end
  #
  # def test_add_stock_to_current_stock()
  #   @pub.add_stock_to_current_stock(@stock)
  #   assert_equal(676767, @pub.check_current_stock)
  # end

  def test_carry_out_transaction()
    @pub.carry_out_transaction(@customer1, @drink1)
    assert_equal(21, @customer1.amount_cash_in_wallet)


  end



  # assert_equal(20, @pub.amount_cash_in_till)
  #
  # assert_equal(18, @customer1.drunkenness)
end
