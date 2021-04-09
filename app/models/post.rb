class Post < ActiveRecord::Base
  validates :title, :summary, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  validate :clickbait
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  def clickbait
    if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title }
      errors.add(:title, "is invalid")
    end
  end 
end
