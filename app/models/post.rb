class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :post_is_clickbait

  def post_is_clickbait
    if !["Won't Believe", "Secret", "Top [number]", "Guess"].include?(title)
      errors.add(:title, "change name")
    end
  end


end
