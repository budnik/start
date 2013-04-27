class Volunteer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :trackable, :omniauthable
  has_many :activities
  has_many :people, through: :activities

  # attr_accessible :title, :body
end
