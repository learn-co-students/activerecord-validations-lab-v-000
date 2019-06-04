class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :clickbait

  def clickbait
    words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if title.present? && !words.any? {|word| title.include?(word)}
      errors.add(:title)
    end
  end
end
