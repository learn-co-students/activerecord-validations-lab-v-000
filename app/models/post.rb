class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if !self.title || self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Guess") || self.title.include?("Top")
    else
      errors.add(:title, "WE NEED MORE CLICKBAIT!")
    end
  end
end
