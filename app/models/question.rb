class Question < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  extend FriendlyId
  friendly_id :body, use: :slugged
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  acts_as_votable
  
  def to_s
  	body
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name(name).questions
  end
end
