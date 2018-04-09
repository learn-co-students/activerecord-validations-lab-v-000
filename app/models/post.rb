class Post < ActiveRecord::Base
	validates_presence_of :title
	validate :is_clickbait?
	validate :summary_length
	validate :content_length
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

 CLICKBAIT_KEYWORDS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

#this was for practice.  Built in helpers work too
	def content_length
    	unless content.size >= 250
      	errors.add(:content, "Must be above 250 characters") 
    	end
	end

#these were for practice. Built in helpers work too
	def summary_length
		unless summary.size <= 250
		errors.add(:summary, "250 is max characters") 
   		end
	end



   def is_clickbait?
      if CLICKBAIT_KEYWORDS.none? { |keywords| keywords.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  end

