class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }

  validate :clickbait?


  def clickbait?
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]

    if !title.nil?
      if !clickbait_words.any? { |clickbait| title.include?(clickbait) }
        errors.add(:title, "Not cickbaity enough!")
      end
    end
  end

end
