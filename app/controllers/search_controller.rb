class SearchController < ApplicationController

  def index
    @songs = Results.new(search_params).songs

    render json: @songs, each_serializer: SongSerializer
  end

  private

    def search_params
      params[:query] || ''
    end

end