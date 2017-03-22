class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, in: %w( Fiction Non-Fiction)

  validate :clickbaitiness

  CLICKBAIT = [ /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]

  def clickbaitiness
    if CLICKBAIT.none? {|pat| pat.match title}
      errors.add(:title, "is not clickbait-y enough")
    end
  end
end
