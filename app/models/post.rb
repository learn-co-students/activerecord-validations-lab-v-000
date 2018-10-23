class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    if title.present? && ["Won't Believe", "Secret", "Top ", "Guess"].none? {|clickbait| title.include?(clickbait)}
      errors.add(:title, "needs to be clickbait")
    end
  end
end
