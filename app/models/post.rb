class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    unless title.present? && title.match(/(Won't Believe|Secret|Top [0-9]+|Guess)/)
      errors.add(:title, "title must be sufficiently clickbait-y")
    end
  end
end
