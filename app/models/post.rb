class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_contains_clickbait

  def title_contains_clickbait
    if !title.nil? && !title.include?("You Won't" || "Secret" || "Top" || "Guess")
      errors.add(:click_bait, "Not a clickbait title")
    end
  end
end
