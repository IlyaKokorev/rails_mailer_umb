# frozen_string_literal: true

class MailerCalling < ActiveJob::Base
  def perform(user)
    UserMailer.new(user).call
  end
end
