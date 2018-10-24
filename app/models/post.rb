class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
    validates :summary, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: %w(Fiction Non-Fiction)
    validate :clickbait

    def clickbait
        title = self.title

        if !!title && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top[number]") || title.include?("Guess"))
            return true
        else
            errors.add(:title, "not clickbait-y enough!")
        end
    end


end
