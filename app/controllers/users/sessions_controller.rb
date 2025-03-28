# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
     super
       rescue ActionController::Redirecting::UnsafeRedirectError
         # you can probably omit the status bit
         # if you're not part of the turbo team.
        redirect_to(after_sign_in_path_for(resource),
          allow_other_host: true,
          # status:           :see_other
        )
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
