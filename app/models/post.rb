class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :post_must_be_clickbaity

  def post_must_be_clickbaity
    if self.title == nil
      errors.add(:title, "You must have a title")
    elsif self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess")
    else
      errors.add(:title, "Title must be more clickbaity")
    end
  end
end
