

class ClickbaitValidator < ActiveModel::Validator
	def validate(record)
		if !record.title.nil? && !record.title.include?("Won't Believe" || "Secret" || "Top #{/[0-9]/}" || "Guess")
			record.errors[:title] << "Needs to be clickbait"
		end
	end
	
end