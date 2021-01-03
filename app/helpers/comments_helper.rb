module CommentsHelper
  def nested_comment(comments)
    comments.map do |comment|
      content_tag(:div, render(comment), class: "nested-comment")
    end.join.html_safe
  end
end
