
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :clickbait_validator

  validate :clickbait_validator

  def clickbait_validator
    valid_titles = ["Won't Believe", "Secret", "Guess"]
    if !self.title.nil? && !valid_titles.find{|title| self.title.include?(title)} && !self.title.match(/^(Top [0-9]+)\z/)
      errors.add(:title, "is not clickbait")
      false
    end
  end
end
