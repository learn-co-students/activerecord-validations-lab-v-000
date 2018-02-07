class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    if title && !title.include?("Won't Believe" || "Secret" || "Top number" || "Guess")
      errors.add(:title, "Needs to be a clickbait title")
    end
  end
end
