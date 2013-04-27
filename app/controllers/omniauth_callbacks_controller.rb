#encoding: utf-8
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def failure
    redirect_to :root, alert: "Неудалось авторизироваться в FACEBOOK"
  end  

  def facebook
    @volunteer = Volunteer.find_or_create_by_fb_id request.env["omniauth.auth"]["uid"] do |v|
      %w(email image name location).each do |f|
        v.send f+?=, request.env["omniauth.auth"]["info"][f]
      end
    end

    if @volunteer.persisted?
      sign_in_and_redirect @volunteer, :event => :authentication #this will throw if @volunteer is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      #would not get here
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_volunteer_registration_url
    end
  end
end
