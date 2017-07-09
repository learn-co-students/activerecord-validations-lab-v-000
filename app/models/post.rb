class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :is_clickbait?

  CLICKBAIT = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]/,
    /Guess/
  ]

  def is_clickbait?
    if CLICKBAIT.none? {|cb| cb.match(title)}
      errors.add(:title, "Insufficient clickbaititude.")
    end
  end
end
