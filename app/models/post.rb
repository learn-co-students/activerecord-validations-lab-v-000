class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top \d*/i, /Guess/i]

  def title_is_clickbaity
    if CLICKBAIT.none? { |x| x.match title}
      errors.add(:title, "not sufficiently clickbaity")
    end
  end
end
