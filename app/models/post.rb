class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [/won't believe/i, /top[0-9]*/i, /secret/i, /guess/]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
     errors.add(:title, "must be clickbait")
   end
  end
end
