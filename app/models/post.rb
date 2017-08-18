class ClickBaity < ActiveModel::Validator
	def validate(record)
		title = record.title || ""
		valid = ["Won't Believe", "Secret", "Top #{/\d*/}", "Guess"].any? do |str|
			title.include? str
		end
		if !valid 
			record.errors[:clickbait] << "Title not clickbaity enough"
		end
	end

end

class Post < ActiveRecord::Base
 	include ActiveModel::Validations
    validates_with ClickBaity
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	
end
