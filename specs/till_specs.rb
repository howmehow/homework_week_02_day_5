require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../till')

class TillTest < MiniTest::Test

  def setup
    @till = Till.new("Till_1", 250.0)
  end

    def test_get_name
      return @till.name
    end
    def test_get_amount
      return @till.amount
    end
end
