class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :is_clickbait?

	SUFF_CLICKBAIT = [
		/Won't Believe/i,
		/Secret/i,
		/Top [0-9]*/i,
		/Guess/i
	]

	def is_clickbait?
		if SUFF_CLICKBAIT.none? { |pattern| pattern.match title}
			errors.add(:title, "must have clickbait-y title")
		end
	end
end
