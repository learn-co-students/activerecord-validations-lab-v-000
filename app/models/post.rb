class ClickbaitValidation < ActiveModel::Validator
	def validate(record)
		
		if record.title.include?("Won't Believe")
			true
		elsif record.title.include?("Secret")
			true
		elsif record.title.include?("Top [number]")
			true
		elsif record.title.include?("Guess")
			true
		else
			record.errors[:base] << "This is not clickbait"
		end
	end
end

class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum:  250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validates_with ClickbaitValidation, if: :title, presence: true

end
