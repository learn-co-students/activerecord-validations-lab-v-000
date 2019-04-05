class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:click_bait, "This Title is not click_baity! Make an other containing 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
      end
    end
end
