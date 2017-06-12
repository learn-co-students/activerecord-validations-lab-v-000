class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    if title && !(["Won't Believe", "Guess", "Secret", "Top[number]"].any? { |phrase| title.include? phrase })
      errors.add(:title, "can't contain clickbait-y words")
    end
  end
end
