class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}

  validate :clickbaity

  def clickbaity
    pattern = [/Won't Believe/i, /Top [0-9]*/i, /guess/i]

    unless pattern.any? {|click| click.match title}
      errors.add(:title, "must be clickbaity")
    end
  end
end
