class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "not a valid category" }
  validate :clickbait

  def clickbait
    
    if title && !title.include?("Won't Believe" || "Secret" || "Top[Number]" || "Guess")
      errors.add(:title, "It has to be clickbait-y!")
    end
  end
end
