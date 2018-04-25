class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait?

  BAIT = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]

  def click_bait?
    if BAIT.none? do |s|
      s.match title
    end
    errors.add(:title, "Add clickbait to title")
    end
  end
end
