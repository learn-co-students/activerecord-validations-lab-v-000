require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250,
  too_short: "%{count} characters is not enough" }
  validates :summary, length: { maximum: 250,
  too_long: "%{count} characters too long" }
  validates :category, inclusion: { in: %w(Fiction Non-fiction),
  message: "%{value} is not a valid category" }
  validate :clickbait_title

  def clickbait_title
    unless title.to_s.include? "Won't Believe" || "Secret" || "Top" || "Guess"
      errors[:title] << "Not interesting enough! Try again bruh."
    end
  end
end
