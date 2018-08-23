class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i,
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |p| p.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
