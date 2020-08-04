require 'rails_helper'

RSpec.describe 'users_controller', type: :system do
  before { signup_user('John Doe', 'JDoe') }

  it 'creates a post' do
    login('JDoe')
    create_gist('This is a test post')
    expect(page).to have_content 'Gist posted successfully'
  end
end