class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction, )}
    validate :is_clickbaity?


    def is_clickbaity?
    	a = title.to_s.downcase
    	if  !(a.include? "won't believe") && !(a.include? "secret")  && !(a.include? "guess")  && !(a.include? "top") 
    		errors.add(:title, "can't be greater than total value")
    	end

    	
    end

end
