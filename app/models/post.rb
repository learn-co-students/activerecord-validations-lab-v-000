class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates_inclusion_of :category, :in => %w( Fiction Non-Fiction )
      validate :clickbait
    

     def clickbait
           unless title =~( /Won't Believe|Secret|,|Top [0-9]|,Guess/)
               errors.add(:title, "title invalid")
           end
     end
        
end