class Post < ActiveRecord::Base

	
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :must_be_clickbait

	def must_be_clickbait
		titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
		if title?

			errors.add(:title, "must be clickbait") unless titles.any? { |phrase| title.include?(phrase)}
		end
	end

end

