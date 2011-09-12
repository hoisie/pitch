class Identity < ActiveRecord::Base
    has_many :emails
    has_many :templates
    
    validates :name, :presence => true
    validates :email, :presence => true
    validates :signature, :presence => true
end
