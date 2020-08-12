require 'rails_helper'

RSpec.describe 'comments_controller', type: :system do
  before { signup_user('John Doe', 'JDoe') }

  it 'sucessfully comments on a post' do
    login('JDoe')
    create_gist('This is a gist')
    fill_in('comment[body]', with: 'Awesome!')
    click_button('Comment')
    expect(page).to have_content('Comment was successfully created.')
  end

  it 'does not create sucessfully create comments when body of comment is empty' do
    login('JDoe')
    create_gist('This is a gist')
    fill_in('comment[body]', with: '')
    click_button('Comment')
    expect(page).to_not have_content 'Comment was successfully created.'
  end
end
