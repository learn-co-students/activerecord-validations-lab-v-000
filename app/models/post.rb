class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbait

 CLICKBAIT_TITLES = ["Won't Believe", "Secret", "Top", "Guess"]

  def title_is_clickbait
    matches = CLICKBAIT_TITLES.detect { |clicky| title&.include?(clicky)}
    if !matches
      errors.add(:title, "Needs more clickbait!")
    end
  end
  
end