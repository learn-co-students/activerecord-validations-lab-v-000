class Post < ActiveRecord::Base

	validates :title, presence: true
	validates_length_of :content, minimum: 250
	validates_length_of :summary, maximum: 250
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :check_for_clickbait

	def check_for_clickbait
		clickbait_phrases = ["Won't Believe", "Secret", "Guess", /Top\s\d/]
		if title && !clickbait_phrases.any?{|substr|title.scan(substr).count > 0}
			errors.add(:title, "Must include clickbait phrase")
		end
	end

end
