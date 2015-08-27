require 'faker'

Artist.delete_all
Album.delete_all
Song.delete_all

10.times do |i|

  Artist.create(
    name: Faker::Name.name,
    albums: 10.times.map do |i|
              Album.create(
                title: Faker::Name.title,
                songs: 5.times.map do |i|
                        Song.create(
                          title: Faker::Name.title
                        )
                      end
              )
            end
  )

end