class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
    validate :isClickbaity?

    PHRASE_TO_SEARCH = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i,  /Guess/i]

	def isClickbaity?
		if PHRASE_TO_SEARCH.none? {|word| word.match title }
			errors.add(:title, "Title not clickbait-y")
		end	
	end
end

