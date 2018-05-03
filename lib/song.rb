
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initilize(name, artist_name)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(string)
    new_song_by_name = self.new
    new_song_by_name.name = string
    new_song_by_name
  end

  def self.create_by_name(string)
    new_song_by_name = self.new
    new_song_by_name.name = string
    new_song_by_name.save
    new_song_by_name
  end

  def self.find_by_name(name)
    all_songs = self.all
    all_songs.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
# if the statement to the left of the pipes evaluates to something falsey, it'll move on to evaluate the statement on the right.
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    #split "artist - song.mp3" into array elements
    #split .mp3 off
    two_elements = file_name.split(" - ")
    artist = two_elements[0]
    song_w_mp3 = two_elements[1]
    new_song_instance = self.new
    new_song_instance.name = song_w_mp3.split(".")[0]
    new_song_instance.artist_name = artist
    return new_song_instance
  end

  def self.create_from_filename(file_name)
    #split "artist - song.mp3" into array elements
    #split .mp3 off
    two_elements = file_name.split(" - ")
    artist = two_elements[0]
    song_w_mp3 = two_elements[1]
    new_song_instance = self.new
    new_song_instance.name = song_w_mp3.split(".")[0]
    new_song_instance.artist_name = artist
    new_song_instance.save
    return new_song_instance
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
