class Post < ActiveRecord::Base
     validates :title, presence: true
     validates :content, length: {minimum: 250}
     validates :summary, length: {maximum: 250}
     validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
     validate :not_clickbait
     
     Clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
     
     def not_clickbait
        
       errors.add(:title, "your message here") unless Clickbait.any? { |string| !!title && title.include?(string) }
     end 
end

