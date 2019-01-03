class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    phrase = [/Secret/, /Guess/, /Won't Believe/, /Top [0-9]*/]
    if phrase.none?{|p| p.match title}
      errors.add(:title, "clickbait")
    end
  end

end
