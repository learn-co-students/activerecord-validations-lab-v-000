class Post < ActiveRecord::Base
  validates :title, presence: true #All posts have a title
  validates :content, length: { minimum: 250 } #Post content is at least 250 characters long
  validates :summary, length: { maximum: 250 } #Post summary is a maximum of 250 characters
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" } #Post category is either Fiction or Non-Fiction
  validate :clickbait_title #custom validator

  def clickbait_title
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:click_bait, "Not a clickbait-y title")
    end
  end
end
