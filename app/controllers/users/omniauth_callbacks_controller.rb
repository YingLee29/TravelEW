class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to root_path
    end
  end
  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end
  def failure
    redirect_to root_path
  end


	# def facebook
 #    generic_callback :facebook
 #  end

 #  def generic_callback provider
 #    @identity = User.from_omniauth(request.env["omniauth.auth"])

 #    @user = @identity || current_user
 #    if @user.persisted?
 #      sign_in_and_redirect @user, event: :authentication
 #      set_flash_message :notice, :success, kind: provider.capitalize if
 #        is_navigational_format?
 #    else
 #      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
 #      redirect_to new_user_registration_url
 #    end
 #  end

 #  def failure
 #    redirect_to root_path
 #  end
end
