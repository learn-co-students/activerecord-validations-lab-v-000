class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 200 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validates :title, format: { with: /(Won't Believe)|(Secret)|(Guess)|(Top\s\d)/}

end

