class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :clickbaity


	def clickbaity
		clickbait = ["Won't Believe", "Secret", "Top", "Guess"]		
		if title
			unless clickbait.any? { |c| title.include?(c) }
   				errors.add(:title, "has to be clickbaity")
			end
		end
	end

end
