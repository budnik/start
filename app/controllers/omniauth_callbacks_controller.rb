#encoding: utf-8
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def failure
    flash[:alert] = "Невдалось авторизуватись через facebook"

    if request.env['omniauth.params']['activity'].present?
      redirect_to ::Activity.find request.env['omniauth.params']['activity']
    else
      redirect_to :root 
    end
  end

  def facebook
    @volunteer = Volunteer.find_or_create_by_uid request.env["omniauth.auth"]["uid"] do |v|
      %w(email image name location).each do |f|
        v.send f+?=, request.env["omniauth.auth"]["info"][f]
      end
    end

    if @volunteer.persisted?
      if request.env['omniauth.params']['activity'].present?
        sign_in @volunteer
        redirect_to ::Activity.find request.env['omniauth.params']['activity']
      else
        sign_in_and_redirect @volunteer, :event => :authentication #this will throw if @volunteer is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      end
    else
      #would not get here
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_volunteer_registration_url
    end
  end
end
