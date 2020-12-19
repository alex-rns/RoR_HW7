class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author
  enum status: [:unpublished, :published]
  validates :body, presence: true
  validates :author_id, presence: true
  scope :unpublished, -> { where(status: 0) }
  scope :published, -> { where(status: 1) }
end
