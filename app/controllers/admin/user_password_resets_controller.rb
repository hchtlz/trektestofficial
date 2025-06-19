module Admin
  class UserPasswordResetsController < ApplicationController
    include Trek::Authentication

    skip_before_action :require_login
    before_action :set_user, only: %i[edit update]
    before_action :redirect_if_logged_in

    helper Trek::I18nHelper
    helper Trek::ThemeHelper

    layout "admin/auth"

    default_form_builder Trek::FormBuilder

    def new
      @user_password_reset = Trek::UserPasswordReset.new
    end

    def edit
    end

    def create
      @user_password_reset = Trek::UserPasswordReset.new(user_password_reset_params)

      @user = @user_password_reset.user
      @user&.deliver_reset_password_instructions!

      redirect_to(%i[admin login], notice: t(".success"))
    end

    def update
      if @user.change_password(params[:user][:new_password])
        redirect_to(%i[admin login], notice: t(".success"))
      else
        render action: "edit"
      end
    end

    private

    def set_user
      @token = params[:id]
      @user = User.load_from_reset_password_token(params[:id])

      not_authenticated if @user.blank?
    end

    def user_password_reset_params
      params.require(:user_password_reset).permit(:email)
    end

    def redirect_if_logged_in
      redirect_to %i[admin root] if logged_in?
    end
  end
end
