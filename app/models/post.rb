class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait 
  
  def clickbait
    # title = title.split(" ")
    if title
      baits = [ "Won't Believe", "Secret", "Top 10", "Guess"]
      unless baits.any? { |word| title.include?(word) }
        errors.add(:title, "not clickbait-y enough" )
      end
    end
  end
  
end
