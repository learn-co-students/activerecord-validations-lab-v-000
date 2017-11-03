class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbaity

    EXCITING_PHRASES = ["Won't Believe", "Secret", "Top", "Guess"]
    
    def title_is_clickbaity
        unless title == nil
            if EXCITING_PHRASES.none? {|phrase| title.include?(phrase)}
                errors.add(:title, "must be clickbait")
            end
        end
    end
end
