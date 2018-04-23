class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 10 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait?

  def clickbait?
    click_bait = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

    if click_bait.none? { |bait| bait.match title }
      errors.add(:title, 'the title must be clickbait')
    end
  end
end
