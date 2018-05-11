class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_y?

  def clickbait_y?
    text = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if text.none? { |t| t.match title }
      errors.add(:title, "Title doesn't contain matching text")
    end
  end
end
