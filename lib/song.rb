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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |each_song_instance| each_song_instance.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name}
  end

  def self.new_from_filename(with_file_name)
    file = with_file_name.split(".").first.split(" - ")
    artist = file.first
    title = file.last
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(with_file_name)
    song = self.new_from_filename(with_file_name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
