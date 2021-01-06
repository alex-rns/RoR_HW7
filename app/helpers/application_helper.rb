module ApplicationHelper
  def nested_comments(comments)
    comments.map do |parent, children|
      render(parent) + content_tag(:div, nested_comments(children), class: 'nested-comment')
    end.join.html_safe
  end
end
