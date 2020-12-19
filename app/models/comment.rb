class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author
  enum status: [:unpublished, :published]
end
