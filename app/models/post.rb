class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category"}
  validate :clickbait
end

CLICKBAIT_TITLES = [
  "Won't Believe",
  "Secret",
  "Top",
  "Guess"
]

def clickbait
  if title && CLICKBAIT_TITLES.none? {|cb| title.include?(cb)}
    errors.add(:title, "needs to be more click-baity")
  end
end
