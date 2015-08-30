class Results

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def songs
    all_collections.uniq
  end

  private


    def all_collections
      SongCollection.new(query).songs +
      ArtistCollection.new(query).songs +
      AlbumCollection.new(query).songs
    end

end