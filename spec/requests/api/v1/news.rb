require 'rails_helper'

RSpec.describe Api::V1::NewsController, type: :request do
  let!(:news) { create(:news, title: 'My trip to Aspen', content: 'Aspen is great') }

  describe 'sessions' do
    it 'signs in user' do
      user = User.create!(email: "fuck@tfz.com", password: "very-secret")
      sign_in user
    end
  end

  describe 'GET /v1/news' do
    it 'should return all the news titles and contents' do
      get '/api/v1/news'

      expected_response = [{
        'id' => news.id, 'title' => 'My trip to Aspen', 'content' => 'Aspen is great'
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end
end
