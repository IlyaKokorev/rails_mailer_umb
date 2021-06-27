class NotificationMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.first
    ExampleMailer.welcome_email(user)
  end
end
