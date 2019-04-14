class MyValidator < ActiveModel::Validator
    CLICKBAIT = "Guess", "Won't Believe", "Secret", "Top "

    def validate(record)
        if !!record.title
            unless CLICKBAIT.any? { |bait| record.title.include?(bait)}
                record.errors[:title] << 'Need clickbait-y reference'
            end
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validates_with MyValidator
end
