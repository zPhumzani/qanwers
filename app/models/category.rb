class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :questions

  def to_s
  	name
  end
end
