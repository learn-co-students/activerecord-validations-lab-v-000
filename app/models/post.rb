class Post < ActiveRecord::Base
     validates :title, presence: true
     validate  :has_phrase
     validates :content, length: {minimum: 250}
     validates :summary, length: {maximum: 250}
     validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}


   def has_phrase
       must_haves = ["Won't Believe", "Secret", "Top", "Guess"]
       any_phrase = must_haves.any? do |must_have|
           next if self.title.nil?
           self.title.include?(must_have)
       end
       if !any_phrase
           errors.add(:title, "Must have a clickbait-y title")
       end
   end
end
