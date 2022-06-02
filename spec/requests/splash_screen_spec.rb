require 'rails_helper'

RSpec.describe 'Splash Screen', type: :request do
  describe 'GET /splash_screen ' do
    let(:user) { create(:user) }

    it 'and user not logged returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
