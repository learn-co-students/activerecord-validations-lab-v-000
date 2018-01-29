class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validate :click_bait
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

def click_bait
  clickbait = ["Won't Believe", "Secret", "Guess", "Top"]
  if self.title
    is_clickbait = clickbait.any? do |bait|
      self.title.include?(bait)
    end
  end
  errors.add(:title, "Must have clickbait title") unless is_clickbait
end
end
