class UserMailer < ApplicationMailer
  helper ApplicationHelper

  def reset_password_email(user)
    @user = user
    @url = edit_admin_user_password_reset_url(@user.reset_password_token)

    I18n.with_locale(@user.locale || I18n.default_locale) do
      mail(to: @user.email)
    end
  end

  def invite_email(user)
    @user = user
    @url = edit_admin_user_password_reset_url(@user.reset_password_token)

    mail(
      to: @user.email
    )
  end
end
