class Post < ActiveRecord::Base
  require 'pry'
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    if self.title && !self.title.match?(/Won't Believe|Secret|Top [number]|Guess/)
      errors.add(:clickbait, "not clickbaity")
    end
  end
end
