class Post < ActiveRecord::Base
  category_name = ['Fiction', 'Non-Fiction']
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, presence: true, inclusion: category_name
  validate :clickbait?

  CLICKBAIT_PATTERNS = [
		/Won't Believe/i,
		/Secret/i,
		/Top [0-9]*/i,
		/Guess/i
	]

  
 	def clickbait?
		if CLICKBAIT_PATTERNS.none? { |p| p.match title }
			errors.add(:title, "must be clickbait")
		end
	end
  end
