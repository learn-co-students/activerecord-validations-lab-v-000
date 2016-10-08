class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250}
  validates :content, length: { minimum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:click_bait, "Not a clickbait-y title")
    end
  end
end
