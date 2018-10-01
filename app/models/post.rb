class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?


  def is_clickbait?
    clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if clickbait.none? {|regx| regx.match title}
      errors.add(:title, "your title is not clickbait-y enough")
    end
  end
end
