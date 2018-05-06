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
    song.name = name
    song.save
    song
  end

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.new
    song.name = string
    song.save
    song
  end

  def self.find_by_name(string)
    self.all.detect{|song| song.name == string}
  end

  def self.find_or_create_by_name(string)
     self.find_by_name(string).nil? ? self.create_by_name(string) : self.find_by_name(string)
  end

  def self.alphabetical
    self.all.map.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
   name = filename.split('.')[0].split('-')[1].strip
   artist = filename.split('.')[0].split('-')[0].strip
   song = self.new
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

  def self.destroy_all
    self.all.clear
  end
end
