class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :non_clickbait

	def non_clickbait
		clickbait=["Won't Believe", "Secret", "Top", "Guess"]
		if title!=nil && clickbait.none?{|bait| title.include?(bait)}
			errors[:title] = "Not clickbait"
		end
	end
end
