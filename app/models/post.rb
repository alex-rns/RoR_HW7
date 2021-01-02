class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, -> { order "updated_at DESC" }, dependent: :destroy
  has_rich_text :content
  validates :title, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {minimum: 10}
  validates :image, url: {allow_blank: true}
end
