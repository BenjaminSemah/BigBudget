require 'rails_helper'

RSpec.describe 'Categories#Index', type: :feature do
  before(:each) do
    maria = User.create(first_name: 'Ave', surname: 'Maria', email: 'maria@mail.com', password: 'password')
    teresa = User.create(first_name: 'Teresa', surname: 'mail', email: 'bob@mail.com', password: 'password')
    cat_one = Group.create(name: 'Category_1', icon: 'https://cdn-icons-png.flaticon.com/512/175/175061.png',
                            user: maria)
    cat_two = Group.create(name: 'Category_2', icon: 'https://cdn-icons-png.flaticon.com/512/6969/6969002.png',
                            user: maria)
    cat_three = Group.create(name: 'Category_3', icon: 'https://cdn-icons-png.flaticon.com/512/6968/6968996.png',
                            user: teresa)

    transact_one = Entity.create(name: 'transaction 1', amount: '10', user: maria)

    cat_one.entities << transact_one
    transact_two = Entity.create(name: 'transaction 2', amount: '15', user: maria)
    cat_two.entities << cat_two
  end

  after(:each) do
    User.destroy_all
  end

  it 'Checks accessibility of page when user is not logged in' do
    visit categories_path
    expect(page).to_not have_content 'Categories'
    expect(page).to have_content 'Your Email'
    expect(page).to have_content 'Password'
  end

  it 'checks accessibility of page with right credentials' do
    visit new_user_session_path
    fill_in 'user_email',	with: 'maria@mail.com'
    fill_in 'user_password',	with: 'password'
    click_button 'Login'

    expect(page).to_not have_content 'BigBudget'
    expect(page).to have_content 'Categories'
  end

  it 'Checks if user can logout from homepage' do
    visit new_user_session_path
    fill_in 'user_email',	with: 'maria@mail.com'
    fill_in 'user_password',	with: 'password'
    click_button 'Login'

    expect(page).to_not have_content 'BigBudget'
    expect(page).to have_content 'Categories'

    click_button 'Logout'

    expect(page).to have_content 'BigBudget'
    expect(page).to_not have_content 'Categories'
  end

  it 'Checks visibility of ONLY current_user\'s categories' do
    visit new_user_session_path
    fill_in 'user_email',	with: 'maria@mail.com.com'
    fill_in 'user_password',	with: 'password'
    click_button 'Login'

    expect(page).to_not have_content 'BigBudget'
    expect(page).to have_content 'Categories'

    expect(page).to have_content 'Category_1'
    expect(page).to have_content 'Category_2'
    expect(page).to_not have_content 'Category_3'
  end

  it 'Checks the display of total amount for each category' do
    visit new_user_session_path
    fill_in 'user_email',	with: 'maria@mail.com'
    fill_in 'user_password',	with: 'password'
    click_button 'Login'

    expect(page).to_not have_content 'BigBudget'
    expect(page).to have_content 'Categories'

    expect(page).to have_content 'Category_1'
    expect(page).to have_content '$ 25'
  end
end
