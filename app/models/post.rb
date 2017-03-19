class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 150 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
  validate :clickbait?

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAIT.none? {|clickbait| clickbait.match title }
      errors.add(:title, "does not contain clickbait")
    end
  end


end
