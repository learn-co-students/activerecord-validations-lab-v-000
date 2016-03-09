class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size"}
  validate :clickbait?

  def clickbait?
    clickbait_phrases = [
      /Won't Believe/i, 
      /Secret/i ,
      /Top [\d]+/i,
      /Guess/i
    ]

    # Add show error for title if none of the regex clickbait phrases match the title
    errors.add(:title, "Must be clickbait") if clickbait_phrases.none? {|clickbait| clickbait.match(title) }
  end
end
