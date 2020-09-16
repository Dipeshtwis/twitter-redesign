module ApplicationHelper
  def after_login(partial)
  	render partial: partial if logged_in?
  end

  def profile_pic(usr, size = '')
  	if usr.photo.present?
      image_tag(usr.photo.to_s, alt: usr.username, class: "pr-2 profile-img #{size}")
    else
      image_tag('https://source.unsplash.com/random/60x60',
                alt: usr.username, class: 'pr-2')
    end
  end

  def cover_pic(usr)
  	if usr.cover_image.present?
      image_tag(usr.cover_image.to_s, alt: usr.username, class: 'pr-2')
    else
      image_tag('https://source.unsplash.com/random/700x250', alt: usr.username, class: 'pr-2')
    end
  end
end
