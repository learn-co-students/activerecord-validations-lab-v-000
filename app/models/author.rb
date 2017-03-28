class Author < ActiveRecord::Base
    #name, phone_number
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, numericality: { only_integer: true }, length: {is: 10}
end
