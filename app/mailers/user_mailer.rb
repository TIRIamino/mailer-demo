class UserMailer < ApplicationMailer
after_create :send_welcome_email
has_many :restaurant

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
    user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end
  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
