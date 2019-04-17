class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  CLICKBAITABLES = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [0-9]*/i]

  def clickbait?
    if !CLICKBAITABLES.any?{|cb| cb.match title }
      errors.add(:title, "this title is not click bait")
    end
  end
end
