class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate  :clickbait

  def clickbait
    unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top #{1..20}") || title.include?("Guess"))
      errors.add(:clickbait, "Not spammy enough. This is a business damn it.")
    end
  end
end
