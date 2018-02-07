class Post < ActiveRecord::Base

  CLICKBAITS = ["Won't Believe", "Secret", "Top ", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?


  def is_clickbait?
    if self.title && !CLICKBAITS.any? { |clickbait| self.title.include?(clickbait) }
        errors.add(:title, "A title must be clickbait'y!")
    end
  end

end
