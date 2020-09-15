module ApplicationHelper
  def after_login(partial)
  	render partial: partial if logged_in?
  end

  def profile_pic(user)
  	if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "pr-2")
    else
      image_tag('https://source.unsplash.com/random/60x60',
                alt: user.username, class: 'pr-2')
    end
  end

  def cover_pic(user)
  	if user.cover_image.present?
      image_tag(user.cover_image.to_s, alt: user.username, class: 'pr-2')
    else
      image_tag('https://source.unsplash.com/random/700x250', alt: user.username, class: 'pr-2')
    end
  end
end
