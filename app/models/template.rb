class Template < ActiveRecord::Base
    validates :name, :presence => true
    validates :subject, :presence => true
    validates :content, :presence => true

    has_many :emails
    belongs_to :identity

    def as_json(*opts)
    	return {
    		:id => id,
    		:subject => subject,
    		:content => content,
    		:name => name,
    		:from => "\"#{identity.name}\" <#{identity.email}>",
    		:identity => identity
    	}
    end
end
