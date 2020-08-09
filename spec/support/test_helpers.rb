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
    fill_in('gist[text]', with: content)
    click_button('commit')
  end

  def user
    a = User.new(name: 'John Doe', username: 'JDoe')
    a.profile_image.attach(io: File.open('spec/support/test_images' + '/img1.jpg'),
                           filename: 'img1.jpg', content_type: 'image/jpg')
    a.cover_image.attach(io: File.open('spec/support/test_images' + '/img2.jpg'),
                         filename: 'img2.jpg', content_type: 'image/jpg')
    a.save
    a
  end
end
