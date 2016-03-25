class Post < ActiveRecord::Base
  validates :title, presence: true#, format: { with: /Won't Believe|Secret|Top [0-9]*|Guess/ }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  def title_is_clickbait
    if title && !title.match(/Won't Believe|Secret|Top [0-9]*|Guess/)
      errors.add(:title, "Title must be clickbait")
    end
  end
end
