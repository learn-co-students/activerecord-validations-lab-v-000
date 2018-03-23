class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait?

  def click_bait?
    errors.add(:title, "Not clickbait-y") unless title.to_s.include?("Won't Believe" || "Secret" || "Top" || "Guess")
  end


end
