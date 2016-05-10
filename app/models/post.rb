class Post < ActiveRecord::Base
  validate :title_is_not_clickbaity
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


  def title_is_not_clickbaity
    clickbait_array = ["Won't Believe", "Secret", "Top", "Guess"]
    if title.present? && !clickbait_array.any? {|word| title.include?(word)}
      errors.add(:title, "Title must include clickbaity words.")
    end
  end

end
