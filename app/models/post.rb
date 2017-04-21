class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
	validates :summary, length: {maximum: 20}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :clickbait?

	def clickbait?
		words = [/Won't Believe/i, /Secret/i, /Top \d*/i, /Guess/i]
		if words.none? {|word| word.match title}
			errors.add(:title, "Does not contain valid title.")
		end
	end
end
