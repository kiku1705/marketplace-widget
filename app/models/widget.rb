class Widget < ApplicationRecord
    belongs_to :seller, class_name: 'User'
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    has_many :transctions
end

