require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(fiction non-fiction Fiction Non-Fiction)}
    validate :catchy?
    #validates :title, inclusion: {in: ["Secret", "Top /[1234567890]/", "Won't Believe", "Guess"]}
    

    def catchy?
	    return false if title == nil
        unless ["Won't Believe", "Secret", "Guess"].any? {|cb| title.match(cb)} || self.title.match(/Top \d*/)
            errors.add(:title, "title is not clickbaity enough")
        end
	end



end
