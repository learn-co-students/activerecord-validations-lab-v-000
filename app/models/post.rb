class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 20}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbait?

  PATTERNS = [/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]


  def clickbait?
    if PATTERNS.none? {|pat| pat.match title}
      errors.add(:title, "this is clickbait")
    end
  end
end
