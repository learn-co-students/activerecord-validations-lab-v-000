class Post < ActiveRecord::Base
    validates :title, presence: true
    validates(:content, { length: { minimum: 250 }})
    validates(:summary, { length: { maximum: 250 }})
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_must_be_clickbait
    
    def title_must_be_clickbait
        clickbait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
        clickbait.each do |bait|               
           if self.title == nil || !self.title.match(bait)
                errors.add(:title, "Title must be present and clickbait")
           else
               return true
           end
        end
    end
    
end
