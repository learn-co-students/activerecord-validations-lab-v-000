class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category"}
  validate :clickbait?

  def clickbait?
    clickbait_options = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]
    title = self.title || ""
    if clickbait_options.none? { |bait| bait.match(title) }
      errors.add(:title, "not sufficiently clickbait-y")
    end
  end

end
