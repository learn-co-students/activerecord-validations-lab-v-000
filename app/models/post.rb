class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: {minimum: 20}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait 

    def clickbait 
        @clickbait = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
        if @clickbait.none? do |w| 
            w.match title 
            end
        errors.add(:title, "Must Be Clickbait")
        end
    end
end
