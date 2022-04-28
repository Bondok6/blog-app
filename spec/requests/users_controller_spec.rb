require 'rails_helper'

RSpec.describe 'Users', type: :request do 
  context 'GET /index' do
    before(:example) { get "/users" }

    it 'Check if response status is correct' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'Check if a correct template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'Check if the response body includes correct placeholder text' do
      expect(response.body).to include('List of Users') 
    end
  end

  context 'GET /show' do
    before(:example) { get "/users/:user_id" }

    it 'Check if response status is correct' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'Check if a correct template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'Check if the response body includes correct placeholder text' do
      expect(response.body).to include('A specific user') 
    end
  end
end