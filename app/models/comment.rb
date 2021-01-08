# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  body       :text
#  edited_at  :datetime
#  status     :integer          default("unpublished")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_ancestry   (ancestry)
#  index_comments_on_author_id  (author_id)
#  index_comments_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (post_id => posts.id)
#
class Comment < ApplicationRecord
  has_ancestry
  has_many :votes, dependent: :destroy
  belongs_to :post, counter_cache: true
  belongs_to :author
  enum status: [:unpublished, :published]
  validates :body, presence: true
  scope :unpublished, -> { where(status: 0) }
  scope :published, -> { where(status: 1) }
end
