class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  private

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def clickbait?
    if title != nil
      if CLICKBAIT.none?{|bait| title.include?(bait)}
        errors.add(:title, "not suffiently clickbait-y")
      end
    end
  end
end
