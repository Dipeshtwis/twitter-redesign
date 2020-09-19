module ApplicationHelper
  def after_login(partial)
    render partial: partial if logged_in?
  end

  def before_login(partial)
    render partial: partial unless logged_in?
  end

  def profile_pic(usr, size = '')
    if usr.photo.present?
      image_tag(usr.photo.to_s, alt: usr.username, class: "pr-2 rounded-circle profile-img #{size}")
    else
      image_tag('https://source.unsplash.com/random/60x60',
                alt: usr.username, class: 'pr-2 rounded-circle profile-img')
    end
  end

  def cover_pic(usr)
    if usr.cover_image.present?
      image_tag(usr.cover_image.to_s, alt: usr.username)
    else
      image_tag('https://source.unsplash.com/random/750x250',
                alt: usr.username)
    end
  end

  def different_path_partial
    if logged_in? && params[:action] == 'index'
      render partial: 'shared/right'
    elsif params[:action] == 'show'
      render partial: 'shared/profile'
    end
  end
end
