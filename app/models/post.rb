# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  comments_count :integer
#  content        :text
#  image          :string
#  name           :string
#  post_views     :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#
class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, -> { order "updated_at DESC" }, dependent: :destroy
  has_rich_text :content
  validates :title, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {minimum: 10}
  validates :image, url: {allow_blank: true}
end
