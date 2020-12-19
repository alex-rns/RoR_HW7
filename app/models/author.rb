class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
