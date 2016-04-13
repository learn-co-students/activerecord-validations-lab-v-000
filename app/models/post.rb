class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 50 }
  validates :summary, length: { maximum: 25 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validates :title, format: { with: /(Won't Believe)|(Secret)|(Guess)|(Top\s\d)/}
end
