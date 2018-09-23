class Post < ActiveRecord::Base
# All posts have a title
  validates :title, presence: true
# Post content is at least 250 characters long
  validates :content, length: { minimum: 250 }
# Post summary is a maximum of 250 characters
  validates :summary, length: { maximum: 250 }
# Post category is either Fiction or Non-Fiction
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
# Ensures the title is sufficiently clickbait-y. If does't contain
# catchy phrase, validator will return false
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
