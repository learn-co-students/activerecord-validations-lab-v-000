class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?

  def is_clickbait?
    if title.present? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        errors.add(:title, "Please use clickbait words")
    end
  end

end
