require 'rails_helper'

RSpec.describe AlbumCollection, type: :model do
  let(:query) { 'something' }
  let(:album_colleciton) { AlbumCollection.new(query) }

  describe '#songs' do
    context 'when albums do not exist' do
      before do
        expect(Album).to receive(:where).with("title ilike ?", "%#{query}%").and_return([])
      end

      it 'returns an empty array' do
        expect(album_colleciton.songs).to eql []
      end
    end

    context 'when albums exist' do
      let(:album) { build(:album) }
      let(:songs) { build_list(:song, 5) }

      before do
        expect(Album).to receive(:where).with("title ilike ?", "%#{query}%").and_return([album])
        expect_any_instance_of(Album).to receive(:songs).and_return(songs)
      end

      it 'returns an array of songs that belong to the album' do
        expect(album_colleciton.songs).to eql songs
      end
    end
  end
end