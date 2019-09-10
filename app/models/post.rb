class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :click_bait?
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  CLICKBAIT_TITLES = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def click_bait?
    if CLICKBAIT_TITLES.none? { |pattern| pattern.match title }
      errors.add(:title, "Title must be clickbait")
    end
  end
end
