class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait

  def click_bait
    if self.title
      errors.add(:title, "is not click bait") unless self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
    end
  end
end
