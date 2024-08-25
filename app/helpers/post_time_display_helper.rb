module PostTimeDisplayHelper
  def display_post_time(posted_at)
    one_day_in_sec = (24 * 60) * 60
    time_since_post = Time.now - posted_at

    time_since_post < one_day_in_sec ? "#{time_ago_in_words(posted_at)} ago" : "on #{get_post_date(posted_at)}"
  end

  def get_post_time(posted_at)
    posted_at.strftime("%l:%M %p")
  end

  def get_post_date(posted_at)
    posted_at.strftime("%b %e, %Y")
  end
end
