class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  @@clickbait_titles = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i]

  def clickbait?
    if @@clickbait_titles.none? {|keywords| keywords.match title}
      errors.add(:title, "not clickbait-ey enough")
    end
  end
end
