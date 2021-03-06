class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if (found == nil)
      self.create_by_name(name)
    else
      found
    end 
  end

  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    parsed_array = filename.split(' - ')
    parsed_array[1] = parsed_array[1].chomp(".mp3")

    new_song = self.new
    new_song.name = parsed_array[1]
    new_song.artist_name = parsed_array[0]
    new_song
  end

  def self.create_from_filename(filename)
    parsed_array = filename.split(' - ')
    parsed_array[1] = parsed_array[1].chomp(".mp3")

    new_song = self.new
    new_song.name = parsed_array[1]
    new_song.artist_name = parsed_array[0]
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end

