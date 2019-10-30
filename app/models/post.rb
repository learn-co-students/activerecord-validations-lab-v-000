class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

  def clickbait
    clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    if self.title && !clickbait.any? {|phrase| self.title.include?(phrase)}
      errors.add(:title, "must have clickbait")
    end
  end

end
