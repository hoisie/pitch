class Email < ActiveRecord::Base
    validates :to, :presence => true
    validates :from, :presence => true
    validates :subject, :presence => true
    validates :content, :presence => true

    belongs_to :template
    belongs_to :identity
    belongs_to :user

    after_create :send_email

    def send_email
        smtp = Net::SMTP.new('smtp.gmail.com', 587)
        smtp.enable_starttls_auto
        secret = {
          :consumer_key => Pitch::Application.config.google_oauth_consumer_key,
          :consumer_secret => Pitch::Application.config.google_oauth_consumer_secret,
          :token => self.user.oauth_token,
          :token_secret => self.user.oauth_secret
        }
        smtp.start('gmail.com', self.user.email, secret, :xoauth)

        message = <<-MESSAGE
From: #{self.from}
To: #{self.to}
Subject: #{self.subject}
#{self.content}
MESSAGE
        puts message
        smtp.send_message message, self.identity.email, self.to

        smtp.finish
    end
end
