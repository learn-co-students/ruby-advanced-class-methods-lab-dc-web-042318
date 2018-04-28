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
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    @@all.select { |n| n.name == name }.first
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name).nil? ? self.create_by_name(name) : self.find_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{ |s| s.name }
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.new_from_filename(filename)
    name = filename.split('.')[0].split('-')[1].strip
    artist = filename.split('.')[0].split('-')[0].strip
    song = Song.new
    song.artist_name = artist
    song.name = name
    song
  end
  
  def self.create_from_filename(filename)
    name = filename.split('.')[0].split('-')[1].strip
    artist = filename.split('.')[0].split('-')[0].strip
    song = self.create
    song.artist_name = artist
    song.name = name
    song
  end
end