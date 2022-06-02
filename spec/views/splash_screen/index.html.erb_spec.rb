require 'rails_helper'

RSpec.describe 'Splash Screen', type: :feature do
  before(:each) do
    User.create(first_name: 'Ave', surname: 'Maria', email: 'avemaria@mail.com', password: 'password')
  end

  after(:each) do
    User.destroy_all
  end

  it 'Checks if page title exists' do
    visit root_path
    expect(page).to have_content 'BigBudget'
  end

  it 'Checks if Login and Sign Up exists' do
    visit root_path
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Sign Up'
  end

  it 'Checks unavailability of splash screen when logged in' do
    visit new_user_session_path
    fill_in 'user_email',	with: 'avemaria@mail.com'
    fill_in 'user_password',	with: 'password'
    click_button 'Login'

    expect(page).to_not have_content 'BigBudget'
    expect(page).to have_content 'Categories'
  end
end
