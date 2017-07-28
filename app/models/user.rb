class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :memberships
   has_many :posts
   has_many :groups, :through => :memberships
   has_one :profile
   has_many :registrations
   has_many :reservations
   accepts_nested_attributes_for :profile
   def generate_authentication_token
     self.authentication_token = Devise.friendly_token
   end
  def display_name
    self.email.split("@").first
  end

  def admin?
    is_admin
  end

end
