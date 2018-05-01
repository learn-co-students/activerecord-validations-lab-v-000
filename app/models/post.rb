class Post < ActiveRecord::Base

    validates :title, presence: true
    validate :has_clickbait?
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    CLICKBAIT = [/Secret/i, /Top/i, /Guess/i, /Won't Believe/i ]

    def has_clickbait?
        if CLICKBAIT.none?{|bait| bait.match title}
            errors.add(:title, message: "Cannot include clickbait")
        end  
    end

end
