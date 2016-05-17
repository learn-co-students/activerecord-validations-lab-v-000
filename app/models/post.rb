class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait

  def click_bait
    if title && !title.include?("Won't Believe" || "Secret" || "Top [Number]" || "Guess")
      errors.add(:title, "Must be clickbait-y")
    end
  end

end
