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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    #song = self.create
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end


  def self.find_by_name(name)
    self.all.find{|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    
    searched_song = self.find_by_name(name)
    searched_song = self.create_by_name(name) unless searched_song
    searched_song

  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
   # binding.pry
    song = self.new_by_name(filename.split(" - ")[1].split(".")[0].strip)
    song.artist_name = filename.split(" - ")[0].strip
    song
  end

  def self.create_from_filename(filename)
    # binding.pry
     song = self.create_by_name(filename.split(" - ")[1].split(".")[0].strip)
     song.artist_name = filename.split(" - ")[0].strip
     song
   end
 
   def self.destroy_all
      self.all.clear 
   end



end
