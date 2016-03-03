class NotClickbaitValidator < ActiveModel::EachValidator

	def validate_each(object,attribute,value)
		if value.include? "True Facts"
			object.errors[attribute] << (options[:message] || "This is clickbait")
		end
	end

end



class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 100}
	validates :summary, length: {maximum: 100}
	validates :category, inclusion: { in: ['Fiction'] }
	validates :title, not_clickbait: false
end
