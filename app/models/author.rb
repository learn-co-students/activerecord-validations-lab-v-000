class Author < ActiveRecord::Base
    validates :name, length: { in: 1..20 }, uniqueness: true, :presence => true
    validates :phone_number, length: { in: 10..11 }
end
