class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    clickbait = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
    if clickbait.none? {|phrase| phrase.match(self.title)}
      errors.add(:title, "Must be clickbait")
    end
  end
end
