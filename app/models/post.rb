class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait


  def clickbait
    if title.present? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, "must have clickbait-y sufficient title")
    end
  end
end
