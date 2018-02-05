class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  private

  def clickbait
    if title
      title.include?("Won't Believe" || "Top" || "Guess" || "Secret")? true : errors.add(:not_clickbait, "true")
    end
  end

end
