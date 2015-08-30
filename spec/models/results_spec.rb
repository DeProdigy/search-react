require 'rails_helper'

RSpec.describe Results, type: :model do
  describe '#songs' do
    let(:query) { 'something' }

    after(:each) do
      Results.new(query).songs
    end

    it 'calls #songs ArtistCollection' do
      expect_any_instance_of(ArtistCollection).to receive(:songs).and_return([])
    end

    it 'calls #songs AlbumCollection' do
      expect_any_instance_of(AlbumCollection).to receive(:songs).and_return([])
    end

    it 'calls #songs SongCollection' do
      expect_any_instance_of(SongCollection).to receive(:songs).and_return([])
    end
  end
end