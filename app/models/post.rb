
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  # validates :title, title_is_clickbait: true

  validate :clickbait

  def clickbait
    if self.title != nil
      if
        !self.title.split.include?("Won't") &&
        !self.title.split.include?("Secret") &&
        !self.title.split.include?("Top") &&
        !self.title.split.include?("Guess")

        errors.add(:title, "Must be clickbait!")
      end
    end
  end
end
