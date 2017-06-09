class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :is_clickbait_y?

  def is_clickbait_y?
    if ![/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].any? { |e| e.match title }
      errors.add(:title, "must be clickbait-y")
    end
  end
end
