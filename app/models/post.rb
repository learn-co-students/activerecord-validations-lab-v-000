class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    if self.title && !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top #{/^[0-9]*$/}"))
      errors.add(:title, "needs to be clickbait-y")
    end
  end

end
