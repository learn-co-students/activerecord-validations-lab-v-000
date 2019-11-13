

  
class Post < ActiveRecord::Base
    CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]
    validates :title, presence: true, uniqueness: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :validate_clickbait
    
    def validate_clickbait 
        if self.title == nil 
            return false
        end
        if self.title.include?(CLICKBAIT[0]) || self.title.include?(CLICKBAIT[1]) || self.title.include?(CLICKBAIT[2]) || self.title.include?(CLICKBAIT[3])
            return true
        else
            errors.add(:title, "must be click baity")
            return false
            
        end
    end
end
