class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  def is_clickbait
    if !title.nil? && ["Won't Believe", "Secret", "Top", "Guess"].none? { |clickbait| title.include?(clickbait) }

    errors.add(:title, "title should be clickbait-y.")
    end
  end
end
