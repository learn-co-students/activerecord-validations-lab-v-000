class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait?

  VALID_CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def click_bait?
    if VALID_CLICKBAIT.none?{ |click| click.match title}
      errors.add(:title, "not interested")
  end
end
end
