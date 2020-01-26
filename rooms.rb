class Room

attr_reader :name, :capacity, :price_for_room
attr_accessor :playlist

  def initialize(name, capacity, playlist, price_for_room)
    @name = name
    @capacity = capacity
    @playlist = playlist
    @price_for_room = price_for_room
  end

  def is_room_too_small(guests)
    if @capacity < guests.number_of_people
      return true
    else
      return false
    end
  end

  def guests_cannot_afford(guests)
    if @price_for_room >= guests.wallet
      return true
    end
  end


end
