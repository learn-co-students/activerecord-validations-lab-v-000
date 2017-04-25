require 'pry'
class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :is_clickbait

	def is_clickbait

		@clicks = [/.*Won't Believe.*/,
			/.*Secret.*/,
			/.*Top \d+.*/,
			/.*Guess.*/]

		if @clicks.none? {|phrase| phrase.match(title)}
			errors.add(:is_clickbait, "Title must have clickbait!")
		end

	end

end
