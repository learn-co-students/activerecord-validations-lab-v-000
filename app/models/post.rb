class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:click_bait, "Not click-baity enough")
    end
  end
end #ends class
