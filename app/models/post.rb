class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|s| record.title.include? s}
                record.errors[:title] << "Title needs to be more clickbait-y."
            end
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    
    include ActiveModel::Validations
    validates_with ClickbaitValidator
end
