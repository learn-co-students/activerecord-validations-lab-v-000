class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 100 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "Not a valid category" }
  validate :non_clickbait 

  def non_clickbait 
    if !title.nil? && !title.include?("You Won't" || "Secret" || "Top" || "Guess")
      errors[:title] = "Not clickbait"
    end
  end

end
