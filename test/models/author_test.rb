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
require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
