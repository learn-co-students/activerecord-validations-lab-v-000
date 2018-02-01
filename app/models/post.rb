class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if title && !title.match(/\b(Won't|Believe|Secret|Top \d+|Guess)\b/)
      errors.add(:title, "more clickbait-y")
    end
  end
end
