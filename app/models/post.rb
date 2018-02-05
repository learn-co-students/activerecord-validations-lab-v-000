class TitleValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /(Won't Believe)/
			record.errors[attribute] << (options[:message] || "Title needs more click bait!")
		end
	end
end

class Post < ActiveRecord::Base
	validates :title, presence: true
	validate :not_click_baity_enough
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }

	def not_click_baity_enough
		unless title =~ /(Won't Believe | Secret | Top [0-9]+ | Guess)/
			errors.add(:title, "Title needs more click bait!")
		end
	end

end
