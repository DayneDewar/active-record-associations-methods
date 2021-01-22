class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def songs_same_genre
    songs.select {|song| song.genre == self}
  end

  def artist_count
    songs_same_genre.map(&:artist).uniq.count
  end

  def all_artist_names
    songs.map {|song| song.artist.name} 
  end
end
