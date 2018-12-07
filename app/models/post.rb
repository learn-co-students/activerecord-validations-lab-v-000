class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
 validates :summary, length: { maximum: 250 }
 validates :category, inclusion: { in: %w(Fiction Non-Fiction),
 message: "%{value} should be Fiction or Non-Fiction"}
 validate :clickbait



 def clickbait
   if title && (title.match("Won't Believe") || title.match('Secret') || title.match('Top[number]') || title.match('Guess'))
     return true
   else
     errors.add(:clickbait, "Title is missing")
   end
 end

end
