class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be either Fiction or Non-Fiction" }

  validate :clickbait_validator?

  def clickbait_validator?
    if title == nil || !title.match(/Won't Believe|Secret|Top\s\d+|Guess/)
      errors.add(:title, "must be clickbait")
    end
  end

end
