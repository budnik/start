class Volunteer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :trackable, :validatable, :omniauthable

  # attr_accessible :title, :body
end