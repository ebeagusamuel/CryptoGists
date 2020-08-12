require 'rails_helper'

RSpec.describe 'gists_controller', type: :system do
  before { signup_user('John Doe', 'JDoe') }

  it 'sucessfully creates a gist' do
    login('JDoe')
    create_gist('This is a test post')
    expect(page).to have_content 'Gist posted successfully'
  end

  it 'does not create a gist when text body is empyty' do
    login('JDoe')
    create_gist('')
    expect(page).to_not have_content 'Gist posted successfully'
  end
end
