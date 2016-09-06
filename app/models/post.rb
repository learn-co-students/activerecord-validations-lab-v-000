class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'], message: "%{value} is not an accepted category." }
  validate :clickbait?

  CLICKBAIT = [
    /Top [0..9]/i,
    /Guess/i,
    /Won't Believe/i,
    /Secret/i
  ]

  def clickbait?
    if CLICKBAIT.none? { |clickbait| clickbait.match title }
      errors.add :title, "Not clickbait-y enough."
    end
  end
end
