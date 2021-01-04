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
