class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :customValidator

  def customValidator
    if title.present? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, 'Need a title with clickbait')
    end
  end
end
