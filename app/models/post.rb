class Post < ActiveRecord::Base
  CLICKBAIT = ["Won't Believe.", "Secret", "Top/\d+/", "Guess"]
  validates :title, presence: true, format: {with: /Won't Believe.|Secret|Top\d+|Guess/}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
