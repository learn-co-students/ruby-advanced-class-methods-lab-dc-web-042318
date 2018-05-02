require 'pry'

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|m| m.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].split(".")[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].split(".")[0]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
