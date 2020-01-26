require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../rooms')
require_relative('../playlist')
require_relative('../guests')

class RoomsTest < MiniTest::Test

  def setup
    @playlist1 = Playlist.new("playlist70s",["Sweet Love - Anita Baker",
  "When Doves Cry - Prince"])

    @room1 = Room.new("Chillax zone", 20, @playlist1, 40)

    @guests4 = Guests.new("Looking for adventure", 1500.0, "When Doves Cry - Prince", 4, 17)
  end

  def test_get_name
    assert_equal("Chillax zone", @room1.name)
  end
  def test_get_playlist
    assert_equal(["Sweet Love - Anita Baker",
  "When Doves Cry - Prince"],@room1.playlist.playlists)
  end

  def test_is_room_too_small()
    result = @room1.is_room_too_small(@guests4)
    assert_equal(false, result)
  end

  def test_guests_cannot_afford()
    assert_nil( @room1.guests_cannot_afford(@guests4))
  end
end
