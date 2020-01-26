require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../playlist')
require_relative('../guests')

class PlaylistTest < MiniTest::Test

  def setup
  @playlist1 = Playlist.new("playlist70s",["Sweet Love - Anita Baker",
"When Doves Cry - Prince"])
  @playlist2 = Playlist.new("playlist_top_hits", ["Sweet Love - Anita Baker",
"Girls Just Want to Have Fun - Cyndi Lauper", "I Wanna Dance with Somebody - Whitney Houston",
"When Doves Cry - Prince",
"Time After Time - Cyndi Lauper"])
  @guests4 = Guests.new("Looking for adventure", 1500.0, "When Doves Cry - Prince", 4, 17)
  end

  def test_get_name
    assert_equal("playlist_top_hits", @playlist2.name)
  end
  def test_is_that_your_fav_song
    result = @playlist1.is_that_your_fav_song(@guests4)
    assert_equal("Whoop whoop", result)
  end

  def test_modifyng_playlist
    @playlist1.add_song("Rihanna - Umbrella")
    assert_equal(["Sweet Love - Anita Baker",
  "When Doves Cry - Prince", "Rihanna - Umbrella"], @playlist1.playlists)
  end
  def test_modifyng_playlist
    @playlist1.add_song("Rihanna - Umbrella")
    @playlist1.remove_song("Rihanna - Umbrella")
    @playlist1.remove_song("Sweet Love - Anita Baker")
    assert_equal(["When Doves Cry - Prince"], @playlist1.playlists)
  end

end
