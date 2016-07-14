class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
 	validate :is_sufficiently_click_baity

 	def is_sufficiently_click_baity
 		patterns = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
 		if !patterns.any? {|pattern| pattern.match(self.title)}
 			errors.add(:title, "can't be in the past")
 		end
 	end

end
