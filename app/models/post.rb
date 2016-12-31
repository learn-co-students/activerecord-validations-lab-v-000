class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbaity?

  CLICKBAIT = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]/,
    /Guess/
  ]

  def is_clickbaity?
    if CLICKBAIT.none?{ |t| t.match title }
      errors.add(:title, "Title must be clickbait-y")
    end
  end
end