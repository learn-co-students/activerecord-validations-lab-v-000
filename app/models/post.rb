class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  # inclusion: { within: %w(Won't, Believe, Secret, Top, Guess), message: "%{value} is not clickbait-y" }
  #
  def clickbait
    if title
      if [/Won't Believe/, /Secret/, /Top/, /Guess/].none? { |word| title.match(word) }
        errors.add(:title, "does not contain a clickbait-y title!!  Try again")
      end
    end
  end
end
