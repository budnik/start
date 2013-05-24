class WelcomeController < ApplicationController
  def index
    @json = "document.points = "
    @json += Person.includes(:activities=>:category).map do |p|
      {
        latitude:   p.latitude,
        longitude:  p.longitude,
        activity: {
          id: p.activities.last.try(:id),
          name: p.activities.last.try(:name),
          deadline: p.activities.last.try(:deadline),
          description: p.activities.last.try(:description),
          icon: p.activities.last.try(:category).try(:icon)
        }
      }
    end.to_json
  end
end
