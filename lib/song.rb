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
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    @@all.last
  end

  def self.create_by_name(name)
    Song.new(name)
  end

end
