class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be Fiction or Non-Fiction"}
  validate :clickbait

  def clickbait
    if !title.to_s.include?("Won't Believe"||"Secret"||"Top"||"Guess")
      errors.add(:title, "make more clickbaity")
    end
  end

end
