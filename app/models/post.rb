require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(fiction non-fiction Fiction Non-Fiction)}
    validate :catchy?
    #validates :title, inclusion: {in: ["Secret", "Top /[1234567890]/", "Won't Believe", "Guess"]}
    
    def catchy?
        if self.title == nil
            false
        elsif self.title.include?("Secret")
       elsif self.title.include?("Top /[1234567890]/")
        elsif self.title.include?("Won't Believe")
        elsif self.title.include?("Guess")
        else 
            false
        end 
    end

end
