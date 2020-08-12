module ApplicationHelper
  def x
    current_user ? 10 : 12
  end

  def y
    current_user ? 2 : 0
  end

  def display_link(user)
    return if current_user == user

    if current_user.followings.exists?(follower_id: user.id)
      link_to('Unfollow', user_unfollow_path(user), method: :post,
                                                    class: 'd-inline-block px-2 py-1 text-white bg-primary rounded
                                                                text-decoration-none')
    else
      link_to('follow', user_follow_path(user), method: :post,
                                                class: 'd-inline-block px-2 py-1 text-white bg-primary rounded
                                                                text-decoration-none')
    end
  end
end
