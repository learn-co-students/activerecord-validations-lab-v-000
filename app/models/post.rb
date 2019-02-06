class Post < ActiveRecord::Base
  
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :summary, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
  validates :content, length: { minimum: 250,
    too_short: "%{count} characters is the minimum allowed" }
  validates :title, presence: true, if: -> { clickbait}

    
  def clickbait
     keywords = [
        "Won't Believe",
        "Secret",
        "Top #{/\d+/}",
        "Guess"
      ]
      if !keywords.any? { |keyword| title.include?(keyword) if title }
        errors.add(:title, "is not clickbait-y")
      end

  end

end
