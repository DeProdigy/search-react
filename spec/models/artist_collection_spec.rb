require 'rails_helper'

RSpec.describe ArtistCollection, type: :model do
  let(:query) { 'something' }
  let(:artist_colleciton) { ArtistCollection.new(query) }

  describe '#songs' do
    context 'when artists do not exist' do
      before do
        ar_model = double
        expect(Artist).to receive(:includes).with(:songs, :albums).and_return(ar_model)
        expect(ar_model).to receive(:where).with("name ilike ?", "%#{query}%").and_return([])
      end

      it 'returns an empty array' do
        expect(artist_colleciton.songs).to eql []
      end
    end

    context 'when artists exist' do
      let(:artist) { build(:artist) }
      let(:songs) { build_list(:song, 5) }

      before do
        ar_model = double
        expect(Artist).to receive(:includes).with(:songs, :albums).and_return(ar_model)
        expect(ar_model).to receive(:where).with("name ilike ?", "%#{query}%").and_return([artist])
        expect_any_instance_of(Artist).to receive(:songs).and_return(songs)
      end

      it 'returns an array of songs that belong to the artist' do
        expect(artist_colleciton.songs).to eql songs
      end
    end
  end
end