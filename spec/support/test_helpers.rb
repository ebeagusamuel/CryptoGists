module TestHelpers
  def signup_user(name, username)
    visit new_user_path
    fill_in('user[name]', with: name)
    fill_in('user[username]', with: username)
    attach_file('user[profile_image]', './spec/support/test_images/img1.jpg')
    attach_file('user[cover_image]', './spec/support/test_images/img2.jpg')
    click_button('commit')
  end

  def login(username)
    visit login_path
    fill_in('username', with: username)
    click_button('commit')
  end

  def create_gist(content)
    fill_in('gist[body]', with: content)
    click_button('commit')
  end
end
