class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait_title

  def clickbait_title
    if self.title && !self.title.match(/(Won't Believe|Secret|Top \d+|Guess)/)
      self.errors.add(:title, "must be clickbait-y")
    end
  end
end
