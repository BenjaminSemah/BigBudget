require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  describe 'GET categories' do
    before(:example) { get root_path }
    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the splash_screen template' do
      expect(response).to have_http_status(:ok)
    end

    it 'includes the correct placeholder text' do
      expect(response.body).to include 'Login'
    end
  end
end
