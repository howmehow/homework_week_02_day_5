require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../snack')

class SnackTest < MiniTest::Test

  def setup
    @snack = Snack.new("Peanuts and chips", 10)
  end

  def test_get_name
    assert_equal("Peanuts and chips", @snack.name)
  end
  def test_get_price
    assert_equal(10, @snack.price)
  end
end
