class TitleValidator < ActiveModel::Validator

	def validate(record)
		if record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess")
			true 
		else
			false 
		end 
	end 
end 