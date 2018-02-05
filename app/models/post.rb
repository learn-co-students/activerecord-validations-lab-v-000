class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_checker?

  private

  def clickbait_checker?
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      errors.add(:title, "Not clickbait-y enough") unless
      self.title.include?(clickbait[0]) || self.title.include?(clickbait[1]) || self.title.include?(clickbait[2]) || self.title.include?(clickbait[3])
    end
  end
end
