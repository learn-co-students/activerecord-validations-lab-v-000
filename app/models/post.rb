class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    clickbait_phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if title.present? && !clickbait_phrases.find {|phrase| title.include?(phrase)}
      errors.add(:title, "must be clickbait")
    end
  end



end
