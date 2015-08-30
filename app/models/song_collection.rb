class SongCollection

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def songs
    Song.includes(:album, :artist).where("title ilike ?", "%#{query}%")
  end

end