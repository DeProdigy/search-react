class ArtistCollection

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def songs
    artists.empty? ? [] : artists.map { |artist| artist.songs }.flatten
  end

  private


    def artists
      @artists ||= Artist.where("name ilike ?", "%#{query}%")
    end

end