class Post < ActiveRecord::Base

	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-fiction" ]}
	validate :title_is_clickbait_y

	def title_is_clickbait_y	
		if !title.nil?
		  errors.add(:title, "Title is not clickbaity enough!") unless title.match(/Won't Believe|Secret|Top\d+|Guess/)
	  end
	end


end
