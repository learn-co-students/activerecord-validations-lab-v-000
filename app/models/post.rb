require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  @@clickbait_phrases = ["Won't Believe", "Secret", "Top (/[0..9]*/)", "Guess"]

  def clickbait
    if @@clickbait_phrases.none?{|phrase|title.include?(phrase) if !!title}
      errors.add(:title, "must contain clickbait phrase")
    end
  end
end
