class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :validate_title

CLICKBAIT = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

  def validate_title
   if CLICKBAIT.none? {|bait| bait.match title}
      errors.add(:title, "Does not include clickbait-y title")
    end
  end

end
