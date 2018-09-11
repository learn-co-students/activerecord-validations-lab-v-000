class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [0-9]*/i]

  def is_clickbait
    if !CLICKBAIT.any? { |word| word.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
