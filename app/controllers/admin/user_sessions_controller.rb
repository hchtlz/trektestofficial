module Admin
  class UserSessionsController < ApplicationController
    include Trek::Authentication

    before_action :redirect_if_logged_in, only: %i[new create]
    skip_before_action :require_login, except: :destroy

    helper Trek::I18nHelper
    helper Trek::ThemeHelper

    layout "admin/auth"

    default_form_builder Trek::FormBuilder

    def new
      @user_session = Trek::UserSession.new
      @user = User.new
    end

    def create
      @user_session = Trek::UserSession.new(user_session_params)
      @user = login(@user_session.email, @user_session.password)

      if @user&.privileged?
        @user.remember_me!
        redirect_back_or_to %i[admin root], notice: t(".success")
      else
        logout
        redirect_back_or_to %i[admin login], alert: t(".failure")
      end
    end

    def destroy
      logout
      redirect_to %i[admin login], notice: t(".success")
    end

    private

    def user_session_params
      params.require(:user_session).permit(:email, :password)
    end

    def redirect_if_logged_in
      redirect_to %i[admin root] if logged_in?
    end
  end
end
