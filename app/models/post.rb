class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 100 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? {|pattern| pattern.match title}
      errors.add(:title, "must be clickbait")
    end
  end
end
