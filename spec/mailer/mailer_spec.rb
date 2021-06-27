# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExampleMailer, type: :mailer do
  let(:valid_user) { create :valid_user }
  let(:invalid_user) { create :invalid_user }

  subject(:mail) { described_class.welcome_email(valid_user).deliver_now }
  subject(:invalid_email) { described_class.welcome_email(invalid_user).deliver_now }

  describe 'for valid email' do
    it 'a sends an mail' do
      expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe 'for invalid email' do
    it 'a dont sends an mail' do
      expect { invalid_email }.to raise_error('Invalid email')
    end
  end

  describe 'sending a letter' do
    it 'and renders the subject' do
      expect(mail.subject).to eq("Welcome, #{valid_user.name}!")
    end

    it 'and renders the receiver mail' do
      expect(mail.to).to eq([valid_user.email])
    end

    it 'and renders the sender mail' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'and assigns @name' do
      expect(mail.body.encoded).to match(valid_user.name)
    end
  end
end
