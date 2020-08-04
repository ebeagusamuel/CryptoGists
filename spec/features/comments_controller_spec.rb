require 'rails_helper'

RSpec.describe 'comments_controller', type: :system do
  before { signup_user('John Doe', 'JDoe') }

  it 'comments on a post' do
    login('JDoe')
    create_gist('This is a gist')
    fill_in('comment[body]', with: 'Awesome!')
    click_button('Comment')
    expect(page).to have_content('Comment was successfully created.')
  end
end
