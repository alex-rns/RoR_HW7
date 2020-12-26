class Author < ApplicationRecord
  has_secure_password
  validates_presence_of   :email
  validates_format_of     :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false

  before_save { self.email = email.downcase }
  has_many :posts
  has_many :comments
  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
