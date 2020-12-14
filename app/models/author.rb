class Author < ApplicationRecord
  has_many :posts
  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
