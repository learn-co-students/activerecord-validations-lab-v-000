class Post < ActiveRecord::Base
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "is not included in the list" }
    validate :is_clickbait?

    CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
        
        def is_clickbait?
            if CLICKBAIT.none? { |word| word.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
