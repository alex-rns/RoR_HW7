# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  vote_value :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  comment_id :bigint           not null
#
# Indexes
#
#  index_votes_on_author_id   (author_id)
#  index_votes_on_comment_id  (comment_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (comment_id => comments.id)
#
class Vote < ApplicationRecord
  belongs_to :author
  belongs_to :comment
end
