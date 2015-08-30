require 'faker'

Artist.delete_all
Album.delete_all
Song.delete_all

10.times do |i|

  artist = Artist.create(name: Faker::Name.name)
  artist.albums = 10.times.map do |i|
    Album.create(
      title: Faker::Name.title,
      songs: 5.times.map do |i|
        Song.create(
          title: Faker::Name.title,
          artist: artist
        )
      end
      )
    end

  artist.save!
end