class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  def clickbait
    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if self.title && !clickbait.any? { |word| self.title.include?(word) }
      errors.add(:title, "must include clickbait")
    end
  end
end
