class Compliment < ApplicationRecord
    validates :message , presence: true
end
