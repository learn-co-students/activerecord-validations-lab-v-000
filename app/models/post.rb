class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

  validate :if_clickbaitYN?

  CLICKBAIT_STRINGS = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]*/,
    /Guess/
  ]

  def if_clickbaitYN?
    if CLICKBAIT_STRINGS.none? { |str| str.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
