class Reception
  attr_reader :name, :till, :rooms
  attr_accessor :checked_in
  def initialize(name, till, rooms)
    @name = name
    @till = till
    @rooms = rooms
    @checked_in = []
  end
    def get_room_name(room)
      return room.name
    end
  def checking_in(room, guests)
    return if room.is_room_too_small(guests)
    return if room.guests_cannot_afford(guests)
    @till.amount += room.price_for_room
    @checked_in.push(guests.name)
    guests.wallet -= room.price_for_room

    return @till
    return @checked_in
  end
  def checking_out(guests)
    @checked_in.delete(guests.name)
  end

end
