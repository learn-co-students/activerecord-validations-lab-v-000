class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_contains_click_bait

  def title_contains_click_bait
    if title.present? && !title.include?("Won't Believe")
      errors.add(:title, "must be clickbait-y")
    end
  end
end
