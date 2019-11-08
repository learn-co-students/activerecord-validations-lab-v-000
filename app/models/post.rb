class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait_presence

  def clickbait_presence
    if title
      if !( title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.include?("Top"))
        errors.add(:title, "not clickbaity enough")
      end
    end
  end
end
