class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :clickbait?

  def clickbait?
    return true if self.title.to_s.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
    errors.add(:title, "Is Invalid")
  end
end
