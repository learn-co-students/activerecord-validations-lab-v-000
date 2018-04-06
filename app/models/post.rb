class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    if !@@clickbait_terms.find {|term| term.match(title)}
      errors.add(:title, "must be clickbait")
    end
  end

  @@clickbait_terms = [
    /Won't Believe/i,
    /Secret/i,
    /Top [1-9]*/i,
    /Guess/i
  ]
end
