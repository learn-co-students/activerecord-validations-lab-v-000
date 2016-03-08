
class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait_title 

  def clickbait_title
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:click_bait, "Not a clickbait-y title")
    end
  end
end