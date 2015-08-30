require 'rails_helper'

RSpec.describe SongCollection, type: :model do
  let(:query) { 'something' }
  let(:song_colleciton) { SongCollection.new(query) }

  describe '#songs' do
    context 'when songs do not exist' do
      before do
        expect(Song).to receive(:where).with("title ilike ?", "%#{query}%").and_return([])
      end

      it 'returns an empty array' do
        expect(song_colleciton.songs).to eql []
      end
    end

    context 'when songs exist' do
      let(:songs) { build_list(:song, 5) }

      before do
        expect(Song).to receive(:where).with("title ilike ?", "%#{query}%").and_return(songs)
      end

      it 'returns an array of songs' do
        expect(song_colleciton.songs).to eql songs
      end
    end
  end
end