class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  @@phrases = ["Believe", "Secret", "Top", "Guess"]

  def clickbait
    unless !!title && title.split.find {|word| @@phrases.include?(word)}
      errors.add(:title, "Title must contain clickbait")
    end
  end

end
