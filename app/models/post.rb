class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  
  validate :clickbait
  
  def clickbait
    if !/Won't Believe|Secret|Top \d*|Guess/.match(title)
    errors.add(:title, "is not clickbait-y enough")
   end
  end
 
end
