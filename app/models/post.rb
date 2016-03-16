class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if title
      unless title.include?("Won't Believe") ||
        title.include?("Secret") ||
        title.include?("Top/\d+/") ||
        title.include?("Guess")
        errors.add(:title, "not click-baity")
      end
    end
  end



end
