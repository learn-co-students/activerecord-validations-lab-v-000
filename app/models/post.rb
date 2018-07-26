class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validates :category, exclusion: { in: [nil] }
  
  def clickbait 
    unless ["Won't Believe", "Secret", /[Top]+\s+\d*/, "Guess"]
      erros.add(:title, "Must be clickbaity")
    end
  end
  
end
