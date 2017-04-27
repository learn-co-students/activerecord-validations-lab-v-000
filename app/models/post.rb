class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :clickbate_title

	def clickbate_title
		key_words = [/.*Won't Believe.*/, /.*Secret.*/, /.*Top \d+.*/, /.*Guess.*/]

		if key_words.none? { |word| word.match(title) }
			errors.add(:clickbate_title, 'needs more clickbate')
		end

	end

end
