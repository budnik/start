#encoding: utf-8
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def failure
    redirect_to :root, alert: "Неудалось авторизироваться в FACEBOOK"
  end  

  def facebook
    raise request.env["omniauth.auth"].to_json
    @user = Volunteer.find_or_create_by_fb_id request.env["omniauth.auth"]["uid"]

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    redirect_to :root, notice: "Ура!"
  end
end
