class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  BAIT = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i]

  def clickbait
    errors.add(:title, "must be clickbait") if BAIT.none? { |b| b.match title}
  end
end
