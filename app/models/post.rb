class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  def clickbait
    phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    result = phrases.select { |phrase| title.to_s.include?(phrase) }
    if result == []
      errors.add(:base, "error")
    end
  end
end
