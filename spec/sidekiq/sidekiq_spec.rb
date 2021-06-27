# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Test sending email with sidekiq", :type => :request do
  let(:valid_user) { create(:valid_user) }
  let(:invalid_user) { create(:invalid_user) }

  subject(:mail) { ExampleMailer.welcome_email(valid_user).deliver_later }
  subject(:invalid_mail) { ExampleMailer.welcome_email(invalid_user).deliver_later }

  describe 'letters are queued for delivery' do
    it 'send email to sidekiq' do
      expect { mail }.to change { Sidekiq::Worker.jobs.size }.by(1)
      expect { invalid_mail }.to change { Sidekiq::Worker.jobs.size }.by(1)
    end
  end
end
