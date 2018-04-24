class Post < ActiveRecord::Base

	validates :title, presence: true 
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

 	validate :clickbait_title

	def clickbait_title
		if title 
			if title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
				# binding.pry
				true 
			else
				# binding.pry
				errors.add(:title, "Must be clickbait")
			end 
		end 
	end 
	
	
end
