class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 100 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    valid_clickbait = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
    if valid_clickbait.none? { |v| v.match title }
      errors.add(:title, "not clickbaity enough!")
    end
  end
end
