require 'rails_helper'

RSpec.describe 'sessions_controller', type: :system do
  before :each do
    signup_user('John Doe', 'JDoe')
    signup_user('Donald Trump', 'DTrump')
  end

  it 'signs in a user' do
    login('JDoe')
    expect(page).to have_content 'Login successful'
  end

  it 'signs out a user' do
    login('JDoe')
    click_link('Logout')
    expect(page).to have_content 'You need to login'
  end
end
