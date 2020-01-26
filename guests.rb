class Guests

attr_reader :name, :fav_song, :number_of_people, :youngest_person_in_group
attr_accessor :wallet

  def initialize(name, wallet, fav_song, number_of_people, youngest_person_in_group)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
    @number_of_people = number_of_people
    @youngest_person_in_group = youngest_person_in_group

  end

  def check_if_there_is_underage
    if @youngest_person_in_group < 18
      return true
    else
      return false
    end
  end
end
