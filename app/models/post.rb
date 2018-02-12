class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait



  def click_bait
    if self.title != nil
      errors.add(:title, "is not attractive enough") unless self.title.include? "Won't Believe"
    end
  end
end
