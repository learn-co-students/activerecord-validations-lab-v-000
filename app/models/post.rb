class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "is not a valid category" }
  validate :clickbait

  CLICKBAIT_REGEX = [
    /Won't Believe/i,
    /Secret/i,
    /Top/i,
    /Guess/i
  ]

  def clickbait
    if CLICKBAIT_REGEX.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
