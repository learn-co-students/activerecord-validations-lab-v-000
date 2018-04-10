class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :content, length: { minimum: 100 }
  validates :summary, length: {maximum: 25 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbaity
    if CLICKBAIT.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
