class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Nonfiction"]}
  validate :is_clickbait?


    CLICKBAIT = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

    def is_clickbait?
    if CLICKBAIT.none? {|clickbait| clickbait.match title}
      errors.add(:title, "doesn't contain clickbait")
    end
  end
end
