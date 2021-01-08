# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  birthday        :datetime
#  email           :string
#  first_name      :string
#  gender          :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Author < ApplicationRecord
  def password_requirements_are_met
    rules = {
      " must contain at least one lowercase letter" => /[a-z]+/,
      " must contain at least one uppercase letter" => /[A-Z]+/,
      " must contain at least one digit" => /\d+/,
      " must contain at least one special character" => /[^A-Za-z0-9]+/
    }
    rules.each do |message, regex|
      if password.present?
        errors.add(:password, message) unless password.match(regex)
      end
    end
  end

  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true, on: :create
  validates :first_name, :last_name, presence: true, on: :update
  validates :password, length: {minimum: 8}, on: :create
  validate :password_requirements_are_met, on: :create
  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, on: :create
  validates_uniqueness_of :email, case_sensitive: false

  before_save { self.email = email.downcase }
  before_save { self.first_name = first_name.strip.capitalize }
  before_save { self.last_name = last_name.strip.capitalize }
  has_many :posts
  has_many :comments
  has_one_attached :avatar
  has_many :votes

  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
