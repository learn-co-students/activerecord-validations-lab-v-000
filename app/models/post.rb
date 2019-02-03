require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  validate :is_clickbaity

  def is_clickbaity
    keywords = [
      "Won't Believe",
      "Secret",
      "Top #{/\d+/}",
      "Guess"
    ]

    if !keywords.any? { |keyword| title.include?(keyword) if title }
      errors.add(:title, "is not clickbait-y")
    end
  end

end
