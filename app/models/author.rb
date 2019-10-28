class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, length: { is: 10 }
    #https://guides.rubyonrails.org/active_record_validations.html
end
