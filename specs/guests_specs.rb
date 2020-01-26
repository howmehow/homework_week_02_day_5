require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../guests')
require_relative('../bar')

class GuestsTest < MiniTest::Test

  def setup
    @guests1 = Guests.new("Killers", 300.0, "Red hot chili peppers - Otherside", 14, 25)
    @guests2 = Guests.new("Unicorns", 100.0, "Wham - I like to woogie hoogie", 5, 33)
    @guests3 = Guests.new("Hello darkness, my old friend", 20.0, "Disturbed - The Sound Of Silence", 4, 44)
    @guests4 = Guests.new("Looking for adventure", 1500.0, "When Doves Cry - Prince", 4, 17)
  end

  def test_get_name
    assert_equal("Killers", @guests1.name)
  end
  def test_get_name
    assert_equal("Hello darkness, my old friend", @guests3.name)
  end
  def test_get_wallet
    assert_equal(1500.0, @guests4.wallet)
  end
  def test_fav_song
    assert_nil(@guests4.fav_song)
  end
  def test_check_if_there_is_underage
    assert_equal(true, @guests4.check_if_there_is_underage )
  end
end
