class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.email_confirmation.subject
  #
  def email_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
