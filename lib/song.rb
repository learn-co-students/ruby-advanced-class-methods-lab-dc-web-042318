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

  def self.find_by_name
    binding.pry
  end

  def self.alphabetical
    @@all.map{ |n| n.name}.sort
  end

  def self.destroy_all
    @@all.clear
  end

end
