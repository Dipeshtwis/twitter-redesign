module UsersHelper
  def show_follower(usr)
    res = ''
    if usr.followers.count > 0
      res << 'Followed by '
      res << link_to(usr.followers.first.fullname, profile_path(usr.followers.first.username))
      res.html_safe
    else
      res << '0 follower'
      res.html_safe
    end
  end
end
