require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index, query: 'something'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end