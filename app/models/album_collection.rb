class AlbumCollection

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def songs
    albums.empty? ? [] : albums.map { |album| album.songs }.flatten
  end

  private


    def albums
      @albums ||= Album.where("title ilike ?", "%#{query}%")
    end

end