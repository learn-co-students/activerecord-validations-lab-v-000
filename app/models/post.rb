class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_y_enough

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  
  def clickbait_y_enough
    if !CLICKBAIT.any? { |phrase| phrase.match title }
      errors.add(:title, "not clickbait-y enough")
    end
  end

end
