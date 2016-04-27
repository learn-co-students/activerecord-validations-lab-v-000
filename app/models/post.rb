

class Post < ActiveRecord::Base
  validates :title, presence: true, format: { with: 
/Won't Believe|Secret|Top \d|Guess/, message: "not clickbait" }
  validates :content, length: {minimum: 40}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "%{value} is not a valid category" }
end
