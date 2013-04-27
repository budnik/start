class Activity < ActiveRecord::Base
  belongs_to :person
  belongs_to :volunteer
  belongs_to :category
  attr_accessible :category, :deadline, :description, :state
end

