class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    cb = ["Won't Believe", "Secret", "/Top \d", "Guess"]
    return if title.nil?
    unless cb.any? { |x| title.include?(x) }
      errors.add(:title, "needs to be more clickbait.")
    end
  end
end
