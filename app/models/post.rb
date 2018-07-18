class Post < ActiveRecord::Base
  validates :title, presence: true#, inclusion: {in: ["Won't Believe", "Guess", "Secret", "Top [number]"]}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if self.title
      errors.add(:title, "Need clickbait") unless self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
    end
  end

end
