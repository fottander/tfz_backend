RSpec.describe Api::V1::RidersController, type: :request do
  let!(:rider) { create(:rider, name: 'Felix', ytlink: 'UU4545', vimeolink: 'vimeo.com/felix') }

  describe 'sessions' do
    it 'signs in user' do
      user = User.create!(email: "fuck@tfz.com", password: "very-secret")
      sign_in user
    end
  end

  describe 'GET /v1/riders' do
    it 'should return all the rider names, youtube links and vimeo links' do
      get '/api/v1/riders'

      expected_response = [{
        'id' => rider.id, 'name' => 'Felix', 'ytlink' => 'UU4545', 'vimeolink' => 'vimeo.com/felix'
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end

  describe 'GET /v1/riders' do
    it 'should return the riders name, youtube link and vimeo link' do
      get "/api/v1/riders/#{rider.id}"

      expected_response = {
        'id' => rider.id, 'name' => 'Felix', 'ytlink' => 'UU4545', 'vimeolink' => 'vimeo.com/felix'
      }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end

    it 'should render error message on failure' do
      get '/api/v1/riders/999999'
      expected_response = {message: "Couldn't find Rider with 'id'=999999"}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
      expect(response.status).to eq 404
    end
  end
end
