class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :is_clickbait?

  def is_clickbait?
    if self.title
      errors.add(:title, "must be click bait") unless self.title.include?("Won't Believe" || "Secret" || /Top \d/ || "Guess")
    end
  end
end
