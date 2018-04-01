class ClickBaitValidator < ActiveModel::Validator
    def validate(record)
        if record.title.downcase.split(' ').any?{|word| word == "top" || word == "believe" || word == "secret" || word == "guess" || word == "true"}
            false
        end 
    end
end


class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction","Non-Fiction"]}
    
    validates_with ClickBaitValidator
end

