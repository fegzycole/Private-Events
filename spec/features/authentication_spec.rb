require 'rails_helper'
 
RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com')
  end

  it 'Should Signup' do
    visit new_user_path
    fill_in 'user[email]', with: 'newUser@mail.com'
    fill_in 'user[name]', with: 'User'
    click_button 'Create User'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
    expect(page).to have_content('Logout')
  end

  it 'Should Signin' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
    expect(page).to have_content('Logout')
  end

  it 'Should Signout' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    click_on 'Logout'
    expect(page).to have_content('Email')
    expect(page).to have_content('Login')
    expect(page).to have_content('Signup')
  end
end
