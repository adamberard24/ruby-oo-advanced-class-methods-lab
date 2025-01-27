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

  def self.new_by_name(songs)
   song = self.create
   song.name = songs
   song
  end

  def self.create_by_name(songs)
    song = self.create
    song.name = songs
    song

  end

  def self.find_by_name(song)
   @@all.find{|song_instance| song_instance.name == song}

  end

  def self.find_or_create_by_name(songs) 
    if self.find_by_name(songs) == nil
      self.create_by_name(songs)
      else 
      self.find_by_name(songs)
    end
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
     end
   
     def self.create_from_filename(filename)
       split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
   @@all << song
     end
     def self.destroy_all
       @@all.clear
   end
  
end
