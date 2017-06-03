class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    baited = Regexp.union([/Won't Believe/,/Secret/,/Top \d/,/Guess/])
    if title && !title.match(baited)
      errors.add(:title, "must be click baity!")
    end
  end
end
