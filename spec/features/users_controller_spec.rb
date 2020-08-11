require 'rails_helper'

RSpec.describe 'users_controller', type: :system do
  before :each do
    signup_user('John Doe', 'JDoe')
    signup_user('Donald Trump', 'DTrump')
  end

  it 'follows a user' do
    login('JDoe')
    click_link('follow')
    expect(page).to have_content 'You have followed Donald Trump'
  end

  it 'unfollows a user' do
    login('JDoe')
    click_link('follow')
    click_link('GISTERS')
    click_link('Unfollow')
    expect(page).to have_content 'You have unfollowed Donald Trump'
  end
end
