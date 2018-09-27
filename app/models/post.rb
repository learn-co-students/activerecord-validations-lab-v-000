class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?


CLICKBAIT_PATTERNS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

def clickbait?
  if CLICKBAIT_PATTERNS.none? {|bait| bait.match title}
    errors.add(:title, "must by clickbait-y!")
  end
end
end
