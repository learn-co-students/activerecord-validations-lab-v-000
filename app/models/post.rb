class Post < ActiveRecord::Base
    TITLE_ARRAY = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(fiction non-fiction)}
    validate :presence_of_title

    def presence_of_title
        if title != nil && !TITLE_ARRAY.any? {|word| title.include?(word)}
			errors.add(:title, "must contain clickbait")
        end
    end
    
end
