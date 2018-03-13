class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} should be Fiction or Non-Fiction" }
  validate :clickbait_title?

  CLICKBAIT_TITLES = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait_title?
    if CLICKBAIT_TITLES.any? { |pat| pat.match title }
      true
    else
      errors.add(:title, "must include Won't Believe, Secret, Top [number], or Guess")
    end
  end

end
