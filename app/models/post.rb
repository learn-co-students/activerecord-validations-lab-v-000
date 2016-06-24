class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

	validate :title_is_clickbaity

	def title_is_clickbaity
		clickbait_array = [/Won't Believe/i, /Guess/i, /Secret/i, /Top [0-9]*/i]
		re = Regexp.union(clickbait_array)
		if !title.nil?
			match = title.match(re).nil?
			if match == true
				errors.add(:title, "Title is not clickbait-y")
			end
		end
	end
	
end
