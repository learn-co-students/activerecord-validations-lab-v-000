class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait?

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def click_bait?
    if CLICKBAIT.none? { |word| word.match title }
      errors.add(:title, "Not Click-Bait-y Enought")
    end
  end
end
