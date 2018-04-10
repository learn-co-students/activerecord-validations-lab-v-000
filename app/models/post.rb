class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
	validates :summary, length: {maximum: 100}
	validates :category, inclusion: {in: %w(Fiction Non-fiction)}
	validate :clickbait

	private 

	def clickbait
		unless title != nil && title.match(/\bWon't Believe\b|\bTop\b|\bSecret\b|\bGuess\b/)  
			errors.add(:title, "title not clickbaitable enough")
		end
	end

end

# "Won't Believe", "Secret", "Top
# [number]", or "Guess"
