class ExampleMailerJob < ApplicationJob
  queue_as :default

  def perform(user)
    ExampleMailer.with(user: user).welcome_email.deliver_later
  end
end
