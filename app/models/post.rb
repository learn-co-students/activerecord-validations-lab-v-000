class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"],
    message: "%{value} is not a valid category" }
  
  validate :clickbait?
  
  
  def clickbait?
    unless self.title.nil?
      unless self.title.match(/Won't Believe|Secret|Top [\d]+|Guess/)
        errors.add(:title, "is not clickbait")
      end
    end 
  end  

end