class Bar

  attr_reader :name, :till, :drinks
  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def selling_a_drink(guests, drink, till)
    if guests.check_if_there_is_underage == false
      guests.wallet -= drink.price
      till.amount += drink.price
      return guests.wallet
      return till.amount
    else
      p "Show me your id's again!"
    end
  end
  def selling_a_snack(guests, snack, till)
    guests.wallet -= snack.price
    till.amount += snack.price
    return guests.wallet
    return till.amount
  end
end
