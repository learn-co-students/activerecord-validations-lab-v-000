class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait
  # include ActiveModel::Validations
  #   validates_with MyValidator
  CLICKBAIT = ["Top [Number]", "Secret", "Won't Believe", "Guess"]
  def clickbait
      errors.add(:title, "is not valid") unless CLICKBAIT.any? { |word| title && title.include?(word) }
  end
end
