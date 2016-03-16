class Post < ActiveRecord::Base
  validates :title, presence: true, format: { with: /Won't Believe|Secret|Top \d*|Guess/i, message: "Must have a clickbait-y title" }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
end

