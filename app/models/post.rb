class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait
  def non_clickbait
    if self.title.nil? || !self.title.include?("Won't Believe"|| "Secret Top[number]" || "Guess")
      errors.add(:title, "non clickbait-y")
    end
  end
end
