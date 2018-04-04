class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  @@terms = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]

  def clickbait?
    if title.present? && @@terms.none?{ |t| t.match(title) }
      errors.add(:title, "is not clickbait-y enough")
    end
  end
end
