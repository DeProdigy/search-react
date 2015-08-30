class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :album_title, :artist_name

  def album_title
    object.album.title
  end

  def artist_name
    object.artist.name
  end
end
