class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  CLICKBAIT = [/Guess/, /Won't Believe/, /Top/, /Secret/]

  def clickbait?
    if CLICKBAIT.none? {|w| w.match(title)}
      errors.add(:title,  'is not clickbait')
    end
  end
end
