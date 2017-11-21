class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if !self.title.to_s.include?("Won't Believe")&&!self.title.to_s.include?("Secret")&&!self.title.to_s.include?("Top")&&!self.title.to_s.include?("Guess")
      errors.add(:clickbait, "Title not clickbait-y enough")
    end
  end

end
