require 'rails_helper'

RSpec.describe Api::V1::NewsController, type: :request do
  let!(:news) { create(:news, title: 'My trip to Aspen', content: 'Aspen is great', all_tags: 'aspen') }

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
        'id' => news.id, 'title' => 'My trip to Aspen', 'content' => 'Aspen is great', 'all_tags' => 'aspen'
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end

  describe 'GET /v1/news' do
    it 'should return the news title,content and file' do
      get "/api/v1/news/#{news.id}"

      expected_response = {
        'id' => news.id, 'title' => 'My trip to Aspen', 'content' => 'Aspen is great', 'all_tags' => 'aspen'
      }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end

    it 'should render error message on failure' do
      get '/api/v1/news/999999'
      expected_response = {message: "Couldn't find News with 'id'=999999"}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
      expect(response.status).to eq 404
    end
  end
end
