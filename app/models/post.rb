class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|item| item.match title}
      errors.add(:title, "invalid")
    end
  end

end
