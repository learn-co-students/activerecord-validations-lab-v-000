class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait?
    if self.title.to_s.include?("Won't Believe" || "Secret" || "Top /\d/" || "Guess")
		return true
	else
      errors.add(:title, "Title must be clickbait")
 	end
  end
end
