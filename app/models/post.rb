class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  valid_categories = ['Fiction', 'Non-Fiction']
  validates_inclusion_of :category, :in => valid_categories
  validate :clickbait?

  PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait?
    if PATTERNS.none? { |string| string.match title }
      errors.add(:title, "Must include clickbait-y phrasing")
    end
  end

end
