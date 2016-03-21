class User < ActiveRecord::Base
  after_create :make_profile
  extend FriendlyId
  friendly_id :first_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :comments
  has_many :categories
  has_one :profile
  delegate :gender, :date_of_birth, :country, :interest, :website, :professional_skills, :language, :about_you, to: :profile


  def to_s
  	"#{first_name} #{last_name}"
  end

  def make_profile
    self.create_profile about_you: "Some folks like to mock up web application page flows using Photoshop, Word, or (shudder) HTML. We like using a pencil and paper. It’s quicker, and the customer gets to play too, grabbing the pencil and scribbling alterations right on the paper."
  end
end