class Customer
  attr_reader :name, :drunkenness
  def initialize(name, cash_in_wallet, age, drunkenness)
    @name = name
    @cash_in_wallet = cash_in_wallet
    @age = age #double check
    @drunkenness = drunkenness
  end

  def amount_cash_in_wallet
    return @cash_in_wallet
  end

  def buys_drink(drink)
    @cash_in_wallet -= drink.price
  end

  def am_I_legal?
    if @age > 18
      return true
    else
      return false
    end
  end

  def downs_drink(drink)
    @drunkenness += drink.alcohol_level
  end

  def buys_food(food)
    @cash_in_wallet -= food.price
  end

  def eat_food(food)
    @drunkenness -= food.rejuvenation
  end



end
