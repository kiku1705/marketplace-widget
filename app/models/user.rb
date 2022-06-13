class User < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    has_many :buyers
    has_many :sellers
end
