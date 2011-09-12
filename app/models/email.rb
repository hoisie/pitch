class Email < ActiveRecord::Base
    validates :to, :presence => true
    validates :from, :presence => true
    validates :subject, :presence => true
    validates :content, :presence => true

    belongs_to :template
    belongs_to :identity

    after_create :send_email

    def send_email
        email_obj = self
        Gmail.new(Pitch::Application.config.gmail_username, Pitch::Application.config.gmail_password) do |gmail|
            gmail.deliver do
                to email_obj.to
                from email_obj.from
                subject email_obj.subject
                text_part do
                    body email_obj.content
                end
            end
        end
    end
end
