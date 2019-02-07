class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbaity?

    @@clickbait_patterns = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]/i, 
        /Guess/i
    ]

    def clickbaity?
        if @@clickbait_patterns.none? {|pat| pat.match title}
            errors.add(:title, "Must be clickbait-y!")
        end 
    end 
end
