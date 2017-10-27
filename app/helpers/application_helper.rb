module ApplicationHelper
  def human_timestamp(time)
    return "never" if time.nil?

    content = time_ago_in_words(time) + " ago"
    content_tag( :time, content, class: 'human-timestamp', time: time.to_s, title: time.to_s )
  end
end
