class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non_Fiction) }
  validate :click_bait?

  KEYWORDS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def click_bait?
    if KEYWORDS.none? { |words| words.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
