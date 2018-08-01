class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    unless title.to_s.include?("Won't Believe" || "Secret" || "Top /d/" || "Guess")
      errors.add(:title, "Not sufficiently clickbait-y")
    end
  end

end
