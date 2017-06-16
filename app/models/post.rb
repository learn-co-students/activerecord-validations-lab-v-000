class Post < ActiveRecord::Base
  
  CLICKBAIT_TITLES = ["Won't Believe", "Secret", "Top[number]", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
    message: "%{value} is not a valid category" }
  validate :clickbait
  
  def clickbait
    if !title.nil? && !CLICKBAIT_TITLES.any?{ |t| title.include?(t) }
      errors.add(:title, "must be clickbait")
    end
  end

end