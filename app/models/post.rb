require 'pry'
class Post < ActiveRecord::Base
    # title, content, summary, category
    validates :title, presence: true
    validate :is_clickbaity
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    def is_clickbaity
        # title must include one of the following: "Won't Believe", "Secret", "Top [number]", or "Guess"
        if self.title && !self.title.match(/(Won't Believe|Secret|Top \d+|Guess)/)
            errors.add(:title, "must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
        end
    end
end
