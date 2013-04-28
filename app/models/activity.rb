class Activity < ActiveRecord::Base
  belongs_to :person, class_name: :person
  belongs_to :volunteer
  belongs_to :category
  attr_accessible :name, :deadline, :description, :state, :person_id, :category_id

  state_machine :state, :initial => :open do
    event :apply do
      transition :open => :inprogress
    end
  end 



  rails_admin do
    configure :name, :string
    configure :person, :belongs_to_association
    configure :description, :text
    configure :deadline, :date
    configure :category, :belongs_to_association
    configure :state, :enum do
      enum do
        %w[open inprogress done]
      end
    end
  end
end

