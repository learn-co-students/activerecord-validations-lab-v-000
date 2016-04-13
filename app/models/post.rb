class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-fiction)}
	validate :clickbait?

	

	def clickbait?

		@cb = ["Won't Believe", "Secret", "Top", "Guess"]

		if title != nil
			errors.add(:title, "not clickbaity enough") unless @cb.any?{|word| title.include?(word)}
		end
	end

end
