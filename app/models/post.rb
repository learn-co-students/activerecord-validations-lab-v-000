class Post < ActiveRecord::Base
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity_validator

  def clickbaity_validator
    if title.nil?
      false
    else
      if  title.scan(/(Won't Believe | Top | Secret | Guess)/) == []
        errors.add(:title, "not clickbait-y")
      end
    end
  end
end
