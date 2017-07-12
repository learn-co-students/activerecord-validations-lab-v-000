class Post < ActiveRecord::Base

  validates :title, presence: true
  validate :is_clickable
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


  def is_clickable
    if title != nil && !title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
      errors.add(:title, "Not clickable")
    end
  end
end
