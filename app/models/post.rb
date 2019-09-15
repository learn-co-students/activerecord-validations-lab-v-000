class Post < ActiveRecord::Base
  validates :title, Presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),}
  validate :clickbait_y?

  def clickbait_y?
    clickbaits = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

    if clickbaits.none? { |clickbait| clickbait.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
