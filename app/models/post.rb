class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary , length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_must_be_clickbaity

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def title_must_be_clickbaity
    if CLICKBAIT_PATTERNS.none?  { |pattern| pattern.match(self.title) } 
      errors.add(:title, "False")
    end
  end

end
