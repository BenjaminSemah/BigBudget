require 'rails_helper'

RSpec.describe '/transactions', type: :request do
  before(:each) do
    @user = User.create(first_name: 'Sweet Name', email: 'mail@mail.com', password: 'password')
    @group = Group.create(name: 'Sweet Category', icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png',
                          user: @user)
    @entity = Entity.create(name: 'Sweet Transaction', amount: 150)

    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    get root_path
  end

  describe 'POST /create' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct content' do
      expect(response.body).to include('BigBudget')
    end
  end
end
