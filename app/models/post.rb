class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait?


  CLICKBAIT_PATTERNS = [/Won't believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]

  def click_bait?
    if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
