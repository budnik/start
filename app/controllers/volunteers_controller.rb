class VolunteersController < ApplicationController
  def me
    @activities = Activity.find_all_by_volunteer_id current_volunteer.id
  end
end
