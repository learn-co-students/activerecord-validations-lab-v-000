class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not valid" }
  validate :clickbaity

  def clickbaity
    if title.present? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Title must include clickbaity words.")
    end
  end
end