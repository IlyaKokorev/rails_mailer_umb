# frozen_string_literal: true

class Mailers::ExampleMailer < Mailers::ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @url = 'http://example.com/login'
    @user = user
    mail to: user.email, subject: "Welcome, #{user.name}!"
  end
end
