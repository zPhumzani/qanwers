class Answer < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  extend FriendlyId
  friendly_id :body, use: :slugged
  acts_as_votable
  belongs_to :question
  belongs_to :user
  has_many :comments

  def to_s
  	body
  end
end
