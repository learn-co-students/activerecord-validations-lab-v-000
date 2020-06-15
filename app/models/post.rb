class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, acceptance: {accept: ['Non-Fiction', 'Fiction']}
  validate :is_clickbait?

  # Use regex to store the clickbait approved titles
  # the i makes it case sensitive
  CLICKBAIT_APPROVED = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def is_clickbait?
    unless CLICKBAIT_APPROVED.any? { |p| p.match(title) }
      errors.add(:title, "Title must be clickbait")
    end
  end


end
