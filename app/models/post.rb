class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Ficion)}
    validate :is_clickbait?

    def is_clickbait?
      if !title.nil? && !title.include?("Won't Believe" || "Secret"|| "Top" || "Guess")
        errors.add(:title, "This isn't click bait!")
      end
    end
end
