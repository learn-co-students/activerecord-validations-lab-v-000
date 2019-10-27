require 'pry'

class Post < ActiveRecord::Base

	APPROVED_PATTERNS = [/Won't believe/i, /Secret/i, /Top [0-9]/i, /Guess/i]

	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Nonfiction)}
	validate :clickbaity?

	def clickbaity?
		if APPROVED_PATTERNS.none? do |phrase|
				phrase.match(self.title)
			end
			errors.add(:title, "must contain a clickbaiat pattern")
		end
	end
end
