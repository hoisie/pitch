class Identity < ActiveRecord::Base
    has_many :emails
    has_many :templates
    belongs_to :user
    
    validates :name, :presence => true
    validates :email, :presence => true
    validates :signature, :presence => true
end
