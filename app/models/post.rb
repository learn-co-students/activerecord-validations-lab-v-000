class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 50}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction Biography)}
  validate :clickbait?

  PHRASES = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]

  def clickbait?
    if PHRASES.none? {|phrase| phrase.match title}
      errors.add(:title, "Not enough clickbait")
    end
  end
end
