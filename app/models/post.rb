class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait
    
    def clickbait
        if title
            errors.add(:title, "is non clickbait.") unless title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
        end
    end
end
