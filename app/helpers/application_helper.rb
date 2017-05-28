module ApplicationHelper
  def human_timestamp(time)
    content = time_ago_in_words(time) + " ago"
    content_tag( :time, content, class: 'human-timestamp', time: time.to_s, title: time.to_s )
  end
end
