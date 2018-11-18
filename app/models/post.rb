class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :content, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_validator


  def clickbait_validator
    clickbait_phrases = ["You Won't Believe", "Secret", "Guess"]
    if !title.nil?
      unless clickbait_phrases.any? { |phrases| title.include? phrases }
        errors.add(:title, "must be clickbait")
      end
    end
  end


end
