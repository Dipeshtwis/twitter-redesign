module UsersHelper
  def show_follower(usr)
    res = ''
    if usr.followers.count.positive?
      res << 'Followed by '
      res << link_to(usr.followers.first.fullname, profile_path(usr.followers.first.username))
    else
      res << '0 follower'
    end
    res.html_safe
  end

  def follow_me(usr, partial)
    return if current_user == usr || current_user.follows.include?(usr)

    render partial: partial, locals: { res: usr }
  end
end
