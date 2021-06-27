# frozen_string_literal: true

class UserMailer
  # @param [Object] user
  def initialize(user)
    @user = user
  end

  def call
    check_email!
    send_email
  end

  private

  attr_reader :user

  def check_email!
    raise 'Invalid email' unless user.email.match(URI::MailTo::EMAIL_REGEXP)
  end

  def send_email
    Mailers::ExampleMailer.welcome_email(user).deliver_later
  end
end
