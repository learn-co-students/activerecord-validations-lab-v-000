class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validate :must_be_clickbaity

  def must_be_clickbaity
    if title && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Must be clickbait-y")
    end
  end

end
