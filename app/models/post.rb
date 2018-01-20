class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category" }
  validate :validate_title

  ACCEPTABLE_TITLES = ["Won't Believe", "Secret", "Top [0-9]", "Guess"]

  def validate_title
    if self.title == nil
      return false
    end
    if !self.title.include?(ACCEPTABLE_TITLES[0]) || self.title.include?(ACCEPTABLE_TITLES[1]) || self.title.include?(ACCEPTABLE_TITLES[2]) || self.title.include?(ACCEPTABLE_TITLES[3])
      errors.add(:title, "must be a clickbait-y title")
    end
  end
end
