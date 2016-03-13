class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait


  def is_clickbait
    if !title.nil? && !title.include?("You Won't" || "Secret" || "Top" || "Guess")
      errors.add(:title, "not clickbait")
    end
  end


end
