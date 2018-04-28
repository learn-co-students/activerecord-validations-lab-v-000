class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :clickbait?

	CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

	def clickbait?
		if title != nil
			if CLICKBAIT.none? {|clickbait| title.include?(clickbait)}
				errors.add(:title, "not suffiently clickbait-y")
			end				
		end
	end
end