class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be Fiction or Non-Fiction"}
  validate :clicky

  def clicky
    unless title.to_s.include?("Won't Believe"||"Secret"||"Top"||"Guess")
      errors.add(:title, "We need somthin' that sells!")
    end
  end
end
