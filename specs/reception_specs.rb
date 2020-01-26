require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../reception')
require_relative('../rooms')
require_relative('../guests')
require_relative('../till')

class ReceptionTest < MiniTest::Test

  def setup
    @till = Till.new("Till_1", 250.0)
#(name, capacity, playlist, price_for_room)
    @room1 = Room.new("Chillax zone", 20, @playlist1, 40)
    @room2 = Room.new("Sport bar", 10, @playlist2, 40)
    @room3 = Room.new("You can sing!", 15, @playlist1, 100)
    @rooms = [@room1, @room2, @room3]
#(name, wallet, fav_song, number_of_people, youngest_person_in_group)
    @guests1 = Guests.new("Killers", 300.0, "Red hot chili peppers - Otherside", 14, 25)
    @guests2 = Guests.new("Unicorns", 100.0, "Wham - I like to woogie hoogie", 5, 33)
    @guests3 = Guests.new("Hello darkness, my old friend", 20.0, "Disturbed - The Sound Of Silence", 4, 44)
    @guests4 = Guests.new("Looking for adventure", 1500.0, "When Doves Cry - Prince", 4, 17)

    @reception = Reception.new("CodeClan Karaoke", @till, @rooms)
  end
  def test_get_till
    assert_equal(250.0, @reception.till.amount)
  end
  def test_get_name
    assert_equal("CodeClan Karaoke", @reception.name)
  end
  def test_get_room_name
    result = @reception.get_room_name(@room3)
    assert_equal("You can sing!", result)
  end
  def test_checking_in
    @reception.checking_in(@room3, @guests4)
    @reception.checking_in(@room1, @guests1)
    assert_equal(390.0, @till.amount)
    assert_equal(["Looking for adventure", "Killers"], @reception.checked_in)
  end
  def test_checking_out
     @reception.checking_in(@room3, @guests4)
     @reception.checking_out(@guests4)
     assert_equal([], @reception.checked_in)
   end
end
