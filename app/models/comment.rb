class Comment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :body, use: :slugged
  belongs_to :answer
  belongs_to :user

  def to_s
  	body
  end
end
