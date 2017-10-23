class Post < ActiveRecord::Base
 validates :title, presence: true
 validates :content, length: {minimum: 250}
 validates :summary, length: {maximum: 250}
 validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
 validate  :click_bait

 def click_bait
   if title.nil?|| title.scan(/(Won't Believe|Guess|Secret|Top \d+)/).empty?
     errors.add(:title, "Error")
   end
 end


end
