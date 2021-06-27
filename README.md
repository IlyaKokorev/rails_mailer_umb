# Simple API mailer

This is a simple API sender of emails on Sidekiq + ActionMailer. It works with a database of 100_010 users, of which 10 users have an invalid email and automatically get into the re-queue for sending. To start sending, send a GET request to localhost: 3000/users
