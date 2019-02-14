class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction),
    message: "%{value} is not a valid genre" }
    validate :clickbait


    def clickbait
      if self.title.to_s.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Title isn't clickbaity")
        end
      end
end
