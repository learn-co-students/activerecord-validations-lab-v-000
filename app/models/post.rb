class Post < ActiveRecord::Base
    validates :title, presence: :true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :custom_validation
    
    def custom_validation
        if [/Won't Believe\b/, /Secret\b/, /Top\s[0-9]*/, /Guess\b/].none? {|phrase|  phrase.match(title)}
        errors.add(:title, "insufficiently salacious")
        end
    end

end



  