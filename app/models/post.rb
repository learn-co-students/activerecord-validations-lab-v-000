class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}
  validate :clickbait?

  CLICKBAITS = [
    /Won\'t\sBelieve/,
    /Secret/,
    /Top\s\d/,
    /Guess/
  ]


  def clickbait?
    if CLICKBAITS.none? {|bait| bait.match(title)}
      errors.add(:title, "must be clickbait")
    end
  end

end
