class ApplicationMailer < ActionMailer::Base
  rescue_from Postmark::InactiveRecipientError, with: :log_and_abort

  private

  def log_and_abort(error)
    Rails.logger.info(error)
  end
  default from: email_address_with_name(ENV.fetch("MAILER_FROM", "from@example.com"), I18n.t("application_name"))
  layout "mailer"
end
