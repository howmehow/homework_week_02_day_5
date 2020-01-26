require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../drinks')
require_relative('../till')
require_relative('../guests')
require_relative('../snack')

class BarTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Coke", 3)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Whiskey", 8)
    drinks = [@drink1, @drink2, @drink3]
    @snack = Snack.new("Peanuts and chips", 10)
    @till = Till.new("Till_1", 250.0)

    @guests1 = Guests.new("Killers", 300.0, "Red hot chili peppers - Otherside", 14, 44)

    @bar = Bar.new("CCC", @till, drinks)
  end

    def test_get_name
      assert_equal("CCC", @bar.name)
    end
    def test_get_till
      assert_equal(250.0, @bar.till.amount)
    end

    def test_selling_a_drink
      @bar.selling_a_drink(@guests1, @drink1, @till)
      assert_equal(297.0, @guests1.wallet)
      assert_equal(253.0, @till.amount)
    end
    def test_selling_a_snack
      @bar.selling_a_snack(@guests1, @snack, @till)
      @bar.selling_a_snack(@guests1, @snack, @till)
      assert_equal(280.0, @guests1.wallet)
      assert_equal(270.0, @till.amount)
    end
end
