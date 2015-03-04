class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    if user.email
        mail to: user.email, subject: "Account activation"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  def welcome_email(user)
    @user = user
    @url  = 'http://samandseb.ngrok.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
