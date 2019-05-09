class ClickbaitValidator < ActiveModel::EachValidator
	def validate_each(post, attribute, value)
		unless value =~ /\b(Won't Believe|Secret|Top|Guess)\b/
			post.errors[attribute] << (options[:message] || "must contain a clickbait word")
		end
	end
end