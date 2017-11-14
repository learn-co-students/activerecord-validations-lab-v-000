class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :not_clickbait

  BAD_PHRASES = ["Won't Believe", "Secret", "Top ", "Guess"]

  def not_clickbait
    errors.add(:title, "should be clickbait.") if title && BAD_PHRASES.none?{|text| title.include?(text)}
  end

end
