class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-Fiction), message: "%{value} is not a valid cateogry" }
  validate :non_clickbait


  CLICKABLE = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def non_clickbait
    if CLICKABLE.none? { |click| click.match title }
      errors.add(:title, "Must be clickbait")
    end
  end
end
