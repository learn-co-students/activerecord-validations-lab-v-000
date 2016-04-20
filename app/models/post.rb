class Post < ActiveRecord::Base

  CB_VALUES = [
    /Won't Believe/i, 
    /Secret/i, 
    /Top [0-9]/i,
    /Guess/i
  ]
  
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate  :clickbait?

  def clickbait?

    if !CB_VALUES.any? { |value| value.match title }
      errors.add(:title, "C'mon man. That's not clickbait!")
    end
  end
end
