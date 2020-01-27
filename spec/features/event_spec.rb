# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com')
    User.create(name: 'Otto', email: 'otto@mail.com')
  end

  it 'Should create an event' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
    click_on 'New event'
    expect(page).to have_content('Location')
    fill_in 'event[location]', with: 'Taco bell'
    fill_in 'event[description]', with: 'Meeting to eat some tacos'
    fill_in 'event[date]', with: '2020/01/23'
    find('#event_attendees').select('Otto')
    click_button 'Create event'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
  end

  it 'Should show the event index page' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    click_on 'All events'
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
  end

  it 'Should show the event show page' do
    visit login_path
    fill_in 'session[email]', with: 'user@mail.com'
    click_button 'Sign In'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
    click_on 'New event'
    expect(page).to have_content('Location')
    fill_in 'event[location]', with: 'Taco bell'
    fill_in 'event[description]', with: 'Meeting to eat some tacos'
    fill_in 'event[date]', with: '2020-02-23'
    find('#event_attendees').select('Otto')
    click_button 'Create event'
    expect(page).to have_content('Welcome, User')
    expect(page).to have_content('Upcoming Events')
    expect(page).to have_content('Previous Events')
    click_on 'All events'
    click_on 'view'
    expect(page).to have_content('Taco bell')
  end
end
