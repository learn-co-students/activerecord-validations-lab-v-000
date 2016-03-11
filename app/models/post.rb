class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :title_clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category ." }

  def title_clickbait?
    if title && !title.include?("Won't Believe" || "Secret" || "Top [Number]" || "Guess")
      errors.add(:title, "Title is not clickbait.")
    end
  end

end
