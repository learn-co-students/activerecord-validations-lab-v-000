class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbaitness
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  def clickbaitness
    unless title && (title.include?("Won't Believe") || title.include?("Secret") || title.include?((/Top \d*/).to_s) || title.include?("Guess"))
      errors.add(:title, "is not clickbaity")
    end
  end
end
