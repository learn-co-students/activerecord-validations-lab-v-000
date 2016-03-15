class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :clickBait?
	
	def clickBait?
		unless title && !!title.match(/\bWon't Believe\b|\bSecret\b|\bTop [0-9]+\b|\bGuess|b/i)
			errors[:title] << "Need to include  Won't Believe, Secret, Top [number], or Guess in the title"
		end
	end
	
end
