class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    clickbait = ["Won't Believe", "Secret", "Top #{/[0-9]/}", "Guess"]
    
    if title.present? && !title.match(Regexp.union(clickbait))
      errors.add(:title, "must be clickbait")
    end
  end
  
end
