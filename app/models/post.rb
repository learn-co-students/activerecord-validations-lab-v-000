class Post < ActiveRecord::Base
  
  validates :title, :content, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :summary, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
  validates :content, length: { minimum: 250,
    too_short: "%{count} characters is the minimum allowed" }
    
   validates :clickbait
    
 def clickbait
    keywords = [
      "Won't Believe",
      "Secret",
      "Top #{/\d+/}",
      "Guess"
    ]

    if keywords.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
