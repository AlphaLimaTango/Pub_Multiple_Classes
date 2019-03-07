class Pub
  attr_reader :name, :drinks
  def initialize(name, cash_in_till, drinks, stock)
    @name = name
    @cash_in_till = cash_in_till
    @drinks = []
    @stock = {}

  end

  def amount_cash_in_till
    return @cash_in_till
  end

  def count_drinks_stock(drinks)
    return drinks.length
  end

  def add_money_given_by_customer_to_till(drink)
    @cash_in_till += drink.price
  end

  def check_age_customer(customer)
    return customer.am_I_legal?
  end

  def check_drunkenness_level(customer)
    return customer.drunkenness
  end

  def refuse_service(customer)
    if customer.drunkenness >= 50
      return "You're not getting served"
    else
      return "What do you want?"
    end
  end

  def check_current_stock()
    return @stock
  end

  def add_stock_to_current_stock(drink)
    stock[:drinks] = @all_drinks
  end

  def carry_out_transaction(customer, drink)
    if (check_age_customer(customer) == true && refuse_service(customer) == "What do you want?")
      customer.buys_drink(drink)
      add_money_given_by_customer_to_till(drink)
      customer.downs_drink(drink)
    end
    return
  end


end
