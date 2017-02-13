class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  BAIT = [/Won't Believe/, /Secret/, /Top \d*/, /Guess/]
  def clickbait
    if BAIT.none? {|prompt| prompt.match title}
      errors.add(:title, "must be sufficiently clickbaity")
    end
  end
end
