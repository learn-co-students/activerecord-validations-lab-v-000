class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 50}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :title, format: {with: /Won't Believe|Secret|Top \d|Guess/}
end
