class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250}
	validates :summary, length: { maximum: 250}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :click_baity


	CLICK_BAIT_TERMS = [ /Won't Believe/, /Secret/, /Top [0-9]/, /Guess/
	]

	def click_baity

		if title != nil
			words = CLICK_BAIT_TERMS.select do |regex|
				self.title.match(regex)
			end

			if words.length < 1
				errors.add(:title, "needs to be more clickbaity")
			end
		end
	end
end
