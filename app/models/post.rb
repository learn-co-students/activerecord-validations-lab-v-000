class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} must be Fiction or Non-Fiction" }
    validate :is_clickbait?


    CLICKBAIT_PATTERNS = [ #constant outlines conditions
     /Won't Believe/i,
     /Secret/i, 
     /Top 10/i, 
     /Guess/i 
 ]
    
    def is_clickbait?
    	if CLICKBAIT_PATTERNS.none? { |phr| phr.match title } #regex
    		errors.add(:title, "must be clickbait") #ActiveRecord guide section 6.2
    	end
    end
end
