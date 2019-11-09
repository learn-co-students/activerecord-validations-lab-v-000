class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait

  CLICKBAIT = [
          /Won't Believe/i,
          /Secret/i,
          /Top [0-9]*/i,
          /Guess/i
          ]

       def clickbait
          if CLICKBAIT.none? { |bait| bait.match title }
        errors.add(:title, "must be clickbaity")
      end
    end
end
