class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait


  def clickbait
    phrases = ["Won't Believe", "Secret", "Top [0-9]", "Guess"]
    if phrases.none? { |phrase| title.to_s.include?(phrase) }
      errors.add(:title, "must be clickbait")
    end
  end
end
