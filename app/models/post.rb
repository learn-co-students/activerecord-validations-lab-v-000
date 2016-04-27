class Post < ActiveRecord::Base
  validates :content, length: { minimum: 250 }
  validates :summary , length: { maximum: 250 }
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :title, format: {with: /Won't Believe|Secret|Top\s\d|Guess/}
end
