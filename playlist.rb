class Playlist

attr_reader :name, :playlists

  def initialize(name, playlists)
    @name = name
    @playlists = playlists

  end

  def is_that_your_fav_song(guests)
    for song in @playlists
      if song == guests.fav_song
        return "Whoop whoop"
      end
    end
  end

  def add_song(song)
    @playlists.push(song)
    return @playlists
  end
  def remove_song(song)
    @playlists.delete(song)
    return @playlists
  end
end
