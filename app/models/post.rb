class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :title_must_be_clickbaity

  def title_must_be_clickbaity
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title == nil
      errors.add(:title, "must have title")
    elsif clickbait.any? { |s| self.title.include? s} == false
      errors.add(:title, "must be more clickbaity")
    end
  end

end
