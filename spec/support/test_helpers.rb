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

  # def follow
  #   click_link('follow')
  #   fill_in('article_title', with: title)
  #   fill_in('article_text', with: txt)
  #   attach_file('article_image', './spec/support/test_img.jpg')
  #   check("categories_#{id}")
  #   click_button('commit')
  # end
end
