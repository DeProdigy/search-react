class SongCollection

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def songs
    Song.where("title ilike ?", "%#{query}%")
  end

end