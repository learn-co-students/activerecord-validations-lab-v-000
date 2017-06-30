class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def clickbait
    unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess"))
      errors.add(:title, "invalid")
    end
  end
end
