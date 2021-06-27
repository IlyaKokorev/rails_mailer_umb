class UsersController < ApplicationController
  def index
    users = User.last(15)

    users.each do |user|
      MailerCalling.perform_later(user)
    end

    # User.find_in_batches do |group|
    #   group.each do |user|
    #     UserMailer.new(user).call
    #   end
    # end
  end
end
