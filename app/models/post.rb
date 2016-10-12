class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }
  validate :click_validator

  def click_validator
    click_bait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

    if click_bait.none? { |bait| bait.match title }
      errors.add(:title, "must be clickbait")
    end
  end
  
end
