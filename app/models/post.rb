class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    unless /Won't\sBelieve|Secret|Top\s\d|Guess/.match(title)
      errors.add(:title, "should be clickbait")
    end
  end

end
