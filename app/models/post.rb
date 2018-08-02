class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction)}
    validate :is_clickbait? 
   
    def is_clickbait?
        words =  [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]  # we had to make such like regaex methods.
         if words.none?{|word|word.match title}  
         errors.add(:title, "word dont match")

         end
    end

end #end of class
