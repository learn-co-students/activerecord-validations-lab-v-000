class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length:  {maximum: 250}
  validates :category, inclusion: { in: ["Fiction"]}
  validates :title, format: { with: /(Won't Believe)/}
end
