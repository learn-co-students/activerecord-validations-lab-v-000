class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :is_clickbait

    CLICKBAIT_PATTERNS = [/Won't Believe/i, 
    /Secret/i, 
    /Top [0-9]*/i, 
    /Guess/i]

    def is_clickbait
        if CLICKBAIT_PATTERNS.none? {|pattern| pattern.match(title)}
            errors.add(:title, "Wrong title")

        end
    end
    # private
    # def title
    #     if title includes "Won't Believe", "Secret", "Top [number]", or "Guess"
    # end

    # def validate(title)
    #     unless post.title.include? 'Won't Believe", "Secret", "Top [number]", or "Guess"'
    #       record.errors[:title] << 'Need a different title!'
    #     end
    # end
end
