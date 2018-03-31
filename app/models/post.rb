class Post < ActiveRecord::Base

  validates :title, presence: true
  validate :title_is_clickbaity
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  def title_is_clickbaity
    if title != nil
      if !(title.include?("Won't Believe") || title.include?( "Secret") || title.include?("Top [number]") || title.include?("Guess"))
        errors.add(:title, "Title must be not clickbaity")
      end
    end

  end
end
